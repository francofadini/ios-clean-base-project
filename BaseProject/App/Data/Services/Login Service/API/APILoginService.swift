import Foundation

// MARK: API MODELS

struct APILoginRequest: Codable {
  let username: String
  let password: String
}

struct APILoginResponse: Codable {
  let token: String
  let user: APIUser
}

// MARK: SERVICE

class APILoginService: LoginService {

  func login(username: String,
             password: String,
             successHandler: @escaping (Session) -> Void,
             errorHandler: @escaping (LoginError) -> Void) {

    let body = APILoginRequest(username: username, password: password)

    AlamofireAPIRequestBuilder(baseURL: BASE_URL)
      .withMethod(method: .post)
      .withHeaders(headers: ["Cookie": ""])
      .withEnpoint(endpoint: "/api/accounts/login/")
      .withBody(body: body)
      .buildAndExecute(responseType: APILoginResponse.self, successHandler: { (response) in

        let user = User(identifier: response.user.id,
                        firstName: response.user.first_name,
                        lastName: response.user.last_name)
        let session = Session(token: response.token, user: user)
        successHandler(session)

      }, errorHandler: { (statusCode, error) in

        print(String(describing: statusCode))
        if error == .noInternet {
          errorHandler(.noInternet)
          return
        }

        errorHandler(.other)

      })
  }
}

extension APILoginService: LoginGateway {
  func login(username: String, password: String, completion: @escaping (Session?, LoginError?) -> Void) {
    login(username: username, password: password, successHandler: { (session) in

      completion(session, nil)

    }, errorHandler: { (error) in

      completion(nil, error)
      
    })
  }
}
