import Foundation

// MARK: OUTPUT BOUNDRY

protocol LoginOutput: Boundary {
  func success(response: LoginResponse)
  func failure(error: LoginError)
}

// MARK: RESPONSE MODEL

struct LoginResponse: ResponseModel {
  
}

enum LoginError: ResponseModel {
  case emptyEmail
  case emptyPassword
  case noInternet
  case other
}
