import Foundation

// MARK: OUTPUT BOUNDRY

protocol RegisterOutput: Boundary {
  func success(response: RegisterResponse)
  func failure(error: RegisterError)
}

// MARK: RESPONSE MODEL

struct RegisterResponse {
  
}

enum RegisterError: ResponseModel {
  case emptyEmail
  case emptyPassword
  case emptyRepeatedPassword
  case passwordsNotMatch
  case noInternet
  case other
}
