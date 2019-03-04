import Foundation

class UpdateProfileInteractor: Interactor {
  typealias RequestModelType = UpdateProfileRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: UpdateProfileOutput
  private let updateProfileService: UpdateProfileService
  private let sessionPersistantService: SessionPersistantService

  // MARK: INITIALIZER

  init(output: UpdateProfileOutput,
       updateProfileService: UpdateProfileService,
       sessionPersistantService: SessionPersistantService) {
    
    self.output = output
    self.updateProfileService = updateProfileService
    self.sessionPersistantService = sessionPersistantService
  }

  // MARK: INTERACTOR

  func execute(requestModel: UpdateProfileRequest) {

    if requestModel.firstName == nil || requestModel.firstName!.isEmpty {
      self.output.onUpdateProfileFail(error: .emptyFirstName)
      return
    }

    if requestModel.lastName == nil || requestModel.lastName!.isEmpty {
      self.output.onUpdateProfileFail(error: .emptyLastName)
      return
    }

    guard let session = self.sessionPersistantService.loadSession() else {
      self.output.onUpdateProfileFail(error: .unauthorized)
      return
    }

    self.updateProfileService.updateProfile(identifier: session.user.identifier,
                                            firstName: requestModel.firstName!,
                                            lastName: requestModel.lastName!,
                                            successHandler: { (profile) in

                                                session.updateUser(with: profile)
                                                self.sessionPersistantService.saveSession(session: session)
                                                self.output.onProfileUpdated()

                                            }, errorHandler: { (error) in

                                                self.handle(error: error)

                                            })
  }

  private func handle(error: UpdateProfileServiceError) {
    switch error {
    case .noInternet:
      self.output.onUpdateProfileFail(error: .noInternet)
      return
    default:
      self.output.onUpdateProfileFail(error: .other)
      return
    }
  }
  
}

extension UpdateProfileInteractor: UpdateProfileInput {

  // MARK: LOGIN INPUT

  func updateProfile(requestModel: UpdateProfileRequest) {
    self.execute(requestModel: requestModel)
  }
}
