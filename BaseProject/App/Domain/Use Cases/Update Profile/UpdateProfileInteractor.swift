import Foundation

// MARK: DATA GATEWAYS

protocol UpdateProfileGateway {
  func updateProfile(identifier: Int,
                     firstName: String,
                     lastName: String,
                     completion: @escaping (Profile?, UpdateProfileError?) -> Void)
}

class UpdateProfileInteractor: Interactor {
  typealias RequestModelType = UpdateProfileRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: UpdateProfileOutput
  private let updateProfileGateway: UpdateProfileGateway
  private let sessionPersistantGateway: SessionPersistantGateway

  // MARK: INITIALIZER

  init(output: UpdateProfileOutput,
       updateProfileGateway: UpdateProfileGateway,
       sessionPersistantGateway: SessionPersistantGateway) {
    
    self.output = output
    self.updateProfileGateway = updateProfileGateway
    self.sessionPersistantGateway = sessionPersistantGateway
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

    guard let session = self.sessionPersistantGateway.loadSession() else {
      self.output.onUpdateProfileFail(error: .unauthorized)
      return
    }

    self.updateProfileGateway.updateProfile(identifier: session.user.identifier, firstName: requestModel.firstName!,
                                     lastName: requestModel.lastName!) { (profile, updateProfileError) in

                                      if let error = updateProfileError {
                                        switch error {
                                        case .noInternet:
                                          self.output.onUpdateProfileFail(error: .noInternet)
                                          return
                                        default:
                                          self.output.onUpdateProfileFail(error: .other)
                                          return
                                        }
                                      }

                                      print(profile!)
                                      self.output.onProfileUpdated()

    }
  }
}

extension UpdateProfileInteractor: UpdateProfileInput {

  // MARK: LOGIN INPUT

  func updateProfile(requestModel: UpdateProfileRequest) {
    self.execute(requestModel: requestModel)
  }
}
