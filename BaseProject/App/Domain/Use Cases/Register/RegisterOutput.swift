import Foundation

// MARK: OUTPUT BOUNDRY

protocol RegisterOutput: Boundary {
  func onRegistered()
  func onRegistrationFail(error: RegisterError)
}

// MARK: RESPONSE MODEL

enum RegisterError: ResponseModel {
  case emptyEmail
  case emptyPassword
  case emptyRepeatedPassword
  case passwordsNotMatch
  case noInternet
  case other
}
