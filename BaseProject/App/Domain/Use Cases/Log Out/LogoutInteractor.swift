import Foundation

class LogoutInteractor: Interactor {
  typealias RequestModelType = LogoutRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: LogoutOutput
  private let sessionPersistantGateway: SessionPersistantService

  // MARK: INITIALIZER

  init(output: LogoutOutput,
       sessionPersistantGateway: SessionPersistantService) {

    self.output = output
    self.sessionPersistantGateway = sessionPersistantGateway
  }

  // MARK: INTERACTOR

  func execute(requestModel: LogoutRequest) {
    self.sessionPersistantGateway.removeSession()
    let response = LogoutResponse()
    self.output.onLogoutSuccess(response: response)
  }
}

extension LogoutInteractor: LogoutInput {

  // MARK: LOGIN INPUT

  func logout(requestModel: LogoutRequest) {
    self.execute(requestModel: requestModel)
  }
}
