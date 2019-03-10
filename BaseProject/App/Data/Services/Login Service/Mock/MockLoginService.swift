import Foundation

class MockLoginService: LoginService {
  func login(username: String,
             password: String,
             successHandler: @escaping (Session) -> Void,
             errorHandler: @escaping (LoginServiceError) -> Void) {
    
    let mockedUser = User(identifier: 1, firstName: "Franco", lastName: "Fadini")
    let mockedSession = Session(token: "mockedToken", user: mockedUser)
    successHandler(mockedSession)
  }
}
