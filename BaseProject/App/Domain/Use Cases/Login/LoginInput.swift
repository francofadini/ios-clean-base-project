import Foundation

// MARK: INPUT BOUNDRY

protocol LoginInput: Boundary {
  func login(requestModel: LoginRequest)
}

// MARK: REQUEST MODEL

struct LoginRequest: RequestModel {
  var username: String?
  var password: String?
}
