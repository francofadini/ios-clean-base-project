import Foundation

// MARK: OUTPUT BOUNDRY

protocol RegisterOutput: Boundary {
  func onRegistered()
  func onRegistrationFail(error: RegisterError)
}

enum RegisterError {
  case emptyEmail
  case emptyPassword
  case emptyRepeatedPassword
  case passwordsNotMatch
  case noInternet
  case other
}
