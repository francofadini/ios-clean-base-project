import Foundation

protocol RegisterService: Service {
  func register(username: String,
                password: String,
                repeatedPassword: String,
                successHandler: @escaping (Session) -> Void,
                errorHandler: @escaping (RegisterError) -> Void)
}
