import Foundation

// MARK: OUTPUT BOUNDRY

protocol UpdateProfileOutput: Boundary {
  func onProfileUpdated()
  func onUpdateProfileFail(error: UpdateProfileError)
}

enum UpdateProfileError {
  case emptyFirstName
  case emptyLastName
  case noInternet
  case other
}
