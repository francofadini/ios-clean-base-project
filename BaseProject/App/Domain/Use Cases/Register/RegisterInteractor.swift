import Foundation

// MARK: DATA GATEWAYS

protocol RegisterGateway {
  func register(username: String,
                password: String,
                repeatedPassword: String,
                completion: @escaping (Session?, RegisterError?) -> Void)
}

protocol RegisterSessionPersistantGateway {
  func saveCurrentSession(session: Session)
}

class RegisterInteractor: Interactor {
  typealias RequestModelType = RegisterRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: RegisterOutput
  private let registerGateway: RegisterGateway
  private let sessionPersistantGateway: RegisterSessionPersistantGateway

  // MARK: INITIALIZER

  init(output: RegisterOutput,
       loginGateway: RegisterGateway,
       sessionPersistantGateway: RegisterSessionPersistantGateway) {
    
    self.output = output
    self.registerGateway = loginGateway
    self.sessionPersistantGateway = sessionPersistantGateway
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

    self.registerGateway.register(username: requestModel.username!,
                                  password: requestModel.password!,
                                  repeatedPassword: requestModel.repeatedPassword!,
                                  completion: { (session, registerError) in

                                    if let error = registerError {
                                      switch error {
                                      case .noInternet:
                                        self.output.onRegistrationFail(error: .noInternet)
                                        return
                                      default:
                                        self.output.onRegistrationFail(error: .other)
                                        return
                                      }
                                    }

                                    self.sessionPersistantGateway.saveCurrentSession(session: session!)
                                    self.output.onRegistered()
    })
  }
}

extension LoginInteractor: RegisterInput {

  // MARK: CREATE ORDER INPUT

  func register(requestModel: LoginRequest) {
    self.execute(requestModel: requestModel)
  }
}
