import Foundation

class RegisterInteractor: Interactor {
  typealias RequestModelType = RegisterRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: RegisterOutput
  private let registerService: RegisterService
  private let sessionPersistantService: SessionPersistantService

  // MARK: INITIALIZER

  init(output: RegisterOutput,
       registerService: RegisterService,
       sessionPersistantService: SessionPersistantService) {
    
    self.output = output
    self.registerService = registerService
    self.sessionPersistantService = sessionPersistantService
  }

  // MARK: INTERACTOR

  func execute(requestModel: RegisterRequest) {

    if requestModel.username == nil || requestModel.username!.isEmpty {
      self.output.onRegistrationFail(error: .emptyEmail)
      return
    }

    if requestModel.password == nil || requestModel.password!.isEmpty {
      self.output.onRegistrationFail(error: .emptyPassword)
      return
    }

    if requestModel.repeatedPassword == nil || requestModel.repeatedPassword!.isEmpty {
      self.output.onRegistrationFail(error: .emptyRepeatedPassword)
      return
    }

    if !requestModel.password!.elementsEqual(requestModel.repeatedPassword!) {
      self.output.onRegistrationFail(error: .passwordsNotMatch)
      return
    }
    
    self.registerService.register(username: requestModel.username!,
                                  password: requestModel.password!,
                                  repeatedPassword: requestModel.repeatedPassword!,
                                  successHandler: { (session) in
                                    
                                    self.sessionPersistantService.saveSession(session: session)
                                    self.output.onRegistered()
                                    
                                  }, errorHandler: { (registerError) in
                                    
                                    switch registerError {
                                    case .noInternet:
                                      self.output.onRegistrationFail(error: .noInternet)
                                      return
                                    default:
                                      self.output.onRegistrationFail(error: .other)
                                      return
                                    }
                                    
                                  })
  }
}

extension RegisterInteractor: RegisterInput {

  // MARK: REGISTER INPUT

  func register(requestModel: RegisterRequest) {
    self.execute(requestModel: requestModel)
  }
}
