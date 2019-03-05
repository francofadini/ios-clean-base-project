import Foundation

// MARK: OUTPUT BOUNDRY

protocol LoginOutput: Boundary {
  func onLoggedIn()
  func onLoginFail(error: LoginError)
}

// MARK: RESPONSE MODEL

enum LoginError: ResponseModel {
  case emptyEmail
  case emptyPassword
  case noInternet
  case other
}
