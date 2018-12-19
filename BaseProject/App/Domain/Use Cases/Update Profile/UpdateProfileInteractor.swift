import Foundation

// MARK: DATA GATEWAYS

protocol UpdateProfileGateway {
  func update(firstName: String, lastName: String, completion: @escaping (Session?, UpdateProfileError?) -> Void)
}

class UpdateProfileInteractor: Interactor {
  typealias RequestModelType = UpdateProfileRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: UpdateProfileOutput
  private let updateProfileGateway: UpdateProfileGateway

  // MARK: INITIALIZER

  init(output: UpdateProfileOutput, updateProfileGateway: UpdateProfileGateway) {
    self.output = output
    self.updateProfileGateway = updateProfileGateway
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

    self.updateProfileGateway.update(firstName: requestModel.firstName!,
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
