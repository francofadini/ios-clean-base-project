import Foundation

class AutoLoginInteractor: Interactor {
  typealias RequestModelType = AutologinRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: AutoLoginOutput
  private let sessionPersistantService: SessionPersistantService

  // MARK: INITIALIZER

  init(output: AutoLoginOutput,
       sessionPersistantService: SessionPersistantService) {

    self.output = output
    self.sessionPersistantService = sessionPersistantService
  }

  // MARK: INTERACTOR

  func execute(requestModel: AutologinRequest) {
    if sessionPersistantService.loadSession() != nil {
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
