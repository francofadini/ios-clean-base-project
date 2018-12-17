import Foundation

struct LoginServiceResponse {
  let status: ServiceResponseStatus
  let data: Session?
}

protocol LoginService {
  func login(username: String, password: String, completion: (LoginServiceResponse) -> Void)
}
