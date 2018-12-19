import Foundation

// MARK: INPUT BOUNDRY

protocol UpdateProfileInput: Boundary {
  func updateProfile(requestModel: UpdateProfileRequest)
}

// MARK: REQUEST MODEL

struct UpdateProfileRequest: RequestModel {
  var firstName: String?
  var lastName: String?
}
