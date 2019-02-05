import Foundation

protocol LoginService: Service {
  func login(username: String,
             password: String,
             successHandler: @escaping (Session) -> Void,
             errorHandler: @escaping (LoginServiceError) -> Void)
}

enum LoginServiceError {
  case noInternet
  case other
}
