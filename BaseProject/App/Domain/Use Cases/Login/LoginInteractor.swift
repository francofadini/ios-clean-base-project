import Foundation

class LoginInteractor: Interactor {
  typealias RequestModelType = LoginRequest

  // MARK: PRIVATE ATTRIBUTES

  private weak var output: LoginOutput!
  private let loginService: LoginService
  private let sessionPersistantService: SessionPersistantService

  // MARK: INITIALIZER

  init(output: LoginOutput, loginService: LoginService, sessionPersistantService: SessionPersistantService) {
    self.output = output
    self.loginService = loginService
    self.sessionPersistantService = sessionPersistantService
  }

  // MARK: INTERACTOR

  func execute(requestModel: LoginRequest) {

    if requestModel.username == nil || requestModel.username!.isEmpty {
      self.output.onLoginFail(error: .emptyEmail)
      return
    }

    if requestModel.password == nil || requestModel.password!.isEmpty {
      self.output.onLoginFail(error: .emptyPassword)
      return
    }

    self.loginService.login(username: requestModel.username!,
                            password: requestModel.password!,
                            successHandler: { (session) in

                              self.sessionPersistantService.saveSession(session: session)
                              self.output.onLoggedIn()

                            }, errorHandler: { (loginError) in

                              if loginError == .noInternet {
                                self.output.onLoginFail(error: .noInternet)
                              }
                               
                              self.output.onLoginFail(error: .other)

                            })
  }
}

extension LoginInteractor: LoginInput {

  // MARK: LOGIN INPUT

  func login(requestModel: LoginRequest) {
    self.execute(requestModel: requestModel)
  }
}
