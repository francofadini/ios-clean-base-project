import Foundation

// MARK: OUTPUT BOUNDRY

protocol AutoLoginOutput: Boundary {
  func onAutoLoggedIn()
  func onAutoLoginFail()
}
