import Foundation

// MARK: OUTPUT BOUNDRY

protocol LoginOutput: Boundary {
  func onLoggedIn(responseModel: LoginResponse)
}

// MARK: RESPONSE MODEL

struct LoginResponse: ResponseModel {
  let status: ResponseStatus
  let session: [Order]
}
