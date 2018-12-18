import Foundation

// MARK: DATA GATEWAYS

protocol LoginGateway {
  func login(username: String, password: String, completion: @escaping (Session?, LoginError?) -> Void)
}

protocol LoginSessionPersistantGateway {
  func saveCurrentSession(session: Session)
}

class LoginInteractor: Interactor {
  typealias RequestModelType = LoginRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: LoginOutput
  private let loginGateway: LoginGateway
  private let sessionPersistantGateway: LoginSessionPersistantGateway

  // MARK: INITIALIZER

  init(output: LoginOutput, loginGateway: LoginGateway, sessionPersistantGateway: LoginSessionPersistantGateway) {
    self.output = output
    self.loginGateway = loginGateway
    self.sessionPersistantGateway = sessionPersistantGateway
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

    self.loginGateway.login(username: requestModel.username!,
                            password: requestModel.password!) { (session, loginError) in
      if let error = loginError {
        switch error {
        case .noInternet:
          self.output.onLoginFail(error: .noInternet)
          return
        default:
          self.output.onLoginFail(error: .other)
          return
        }
      }

      self.sessionPersistantGateway.saveCurrentSession(session: session!)
      self.output.onLoggedIn()
    }
  }
}

extension LoginInteractor: LoginInput {
  // MARK: CREATE ORDER INPUT
  func login(requestModel: LoginRequest) {
    self.execute(requestModel: requestModel)
  }
}
