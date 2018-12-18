import Foundation

// MARK: INPUT BOUNDRY

protocol RegisterInput: Boundary {
  func register(requestModel: LoginRequest)
}

// MARK: REQUEST MODEL

struct RegisterRequest: RequestModel {
  var username: String?
  var password: String?
  var repeatedPassword: String?
}
