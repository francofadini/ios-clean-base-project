import Foundation

// MARK: OUTPUT BOUNDRY

protocol AutoLoginOutput: Boundary {
  func success(response: AutoLoginResponse)
  func failure(error: AutoLoginError)
}

// MARK: RESPONSE MODELS

struct AutoLoginResponse: ResponseModel {
  
}

enum AutoLoginError: ResponseModel {
  case other
}
