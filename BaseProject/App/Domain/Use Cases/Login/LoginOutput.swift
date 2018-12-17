import Foundation

// MARK: OUTPUT BOUNDRY

protocol LoginOutput: Boundary {
  func onLoggedIn()
  func onLoginFail(error: LoginError)
}

enum LoginError {
  case emptyEmail
  case emptyPassword
  case noInternet
  case other
}
