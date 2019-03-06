import Foundation

class LoadProfileInteractor: Interactor {
  typealias RequestModelType = LoadProfileRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: LoadProfileOutput
  private let sessionPersistantService: SessionPersistantService

  // MARK: INITIALIZER

  init(output: LoadProfileOutput,
       sessionPersistantService: SessionPersistantService) {
    
    self.output = output
    self.sessionPersistantService = sessionPersistantService
  }

  // MARK: INTERACTOR

  func execute(requestModel: LoadProfileRequest) {

    guard let session = self.sessionPersistantService.loadSession() else {
      self.output.failure(error: .unauthorized)
      return
    }

    let response = LoadProfileResponse(firstName: session.user.firstName,
                                       lastName: session.user.lastName)
    self.output.success(response: response)
  }
}

extension LoadProfileInteractor: LoadProfileInput {

  // MARK: LOGIN INPUT

  func loadProfile(requestModel: LoadProfileRequest) {
    self.execute(requestModel: requestModel)
  }
}
