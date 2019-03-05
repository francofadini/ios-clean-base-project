import Foundation

// MARK: OUTPUT BOUNDRY

protocol UpdateProfileOutput: Boundary {
  func onProfileUpdated()
  func onUpdateProfileFail(error: UpdateProfileError)
}

// MARK: RESPONSE MODEL

enum UpdateProfileError: ResponseModel {
  case emptyFirstName
  case emptyLastName
  case noInternet
  case unauthorized
  case other
}
