import Foundation

class LoadProfileInteractor: Interactor {
  typealias RequestModelType = LoadProfileRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: LoadProfileOutput
  private let sessionPersistantGateway: SessionPersistantService

  // MARK: INITIALIZER

  init(output: LoadProfileOutput,
       sessionPersistantGateway: SessionPersistantService) {
    
    self.output = output
    self.sessionPersistantGateway = sessionPersistantGateway
  }

  // MARK: INTERACTOR

  func execute(requestModel: LoadProfileRequest) {

    guard let session = self.sessionPersistantGateway.loadSession() else {
      self.output.onLoadProfileFail(error: .unauthorized)
      return
    }

    let response = LoadProfileResponse(firstName: session.user.firstName,
                                       lastName: session.user.lastName)
    self.output.onProfileLoaded(response: response)
  }
}

extension LoadProfileInteractor: LoadProfileInput {

  // MARK: LOGIN INPUT

  func loadProfile(requestModel: LoadProfileRequest) {
    self.execute(requestModel: requestModel)
  }
}
