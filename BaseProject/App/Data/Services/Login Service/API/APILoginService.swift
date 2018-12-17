import Foundation

class APILoginService: LoginService {
  func login(username: String, password: String, completion: (LoginServiceResponse) -> Void) {
    
  }
}

extension APILoginService: LoginDatastore {
  func login(username: String, password: String, completion: (Session, DataSourceError?) -> Void) {
    
  }
}
