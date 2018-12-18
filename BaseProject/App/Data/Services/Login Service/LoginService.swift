import Foundation

protocol LoginService: Service {
  func login(username: String,
             password: String,
             successHandler: @escaping (Session) -> Void,
             errorHandler: @escaping (LoginError) -> Void)
}
