import Foundation

// MARK: DATA GATEWAYS

protocol AutoLoginSessionPersistantGateway {
  func loadSession() -> Session?
}

class AutoLoginInteractor: Interactor {
  typealias RequestModelType = AutologinRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: AutoLoginOutput
  private let sessionPersistantGateway: AutoLoginSessionPersistantGateway

  // MARK: INITIALIZER

  init(output: AutoLoginOutput,
       sessionPersistantGateway: AutoLoginSessionPersistantGateway) {

    self.output = output
    self.sessionPersistantGateway = sessionPersistantGateway
  }

  // MARK: INTERACTOR

  func execute(requestModel: AutologinRequest) {
    if sessionPersistantGateway.loadSession() != nil {
      self.output.onAutoLoggedIn()
      return
    }

    self.output.onAutoLoginFail()
  }
}

extension AutoLoginInteractor: AutologinInput {

  // MARK: AUTOLOGIN INPUT

  func autologin(requestModel: AutologinRequest) {
    self.execute(requestModel: requestModel)
  }
}
