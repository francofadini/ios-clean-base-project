import Foundation

struct APILoginRequest: Codable {
  let username: String
  let password: String
}

struct APILoginResponse: Codable {
  let token: String
}

class APILoginService: LoginService {

  func login(username: String,
             password: String,
             successHandler: @escaping (Session) -> Void,
             errorHandler: @escaping (LoginError) -> Void) {

    let body = APILoginRequest(username: username, password: password)

    AlamofireAPIRequestBuilder(baseURL: "http://206.81.12.81")
      .withMethod(method: .post)
      .withHeaders(headers: ["Cookie": ""])
      .withEnpoint(endpoint: "/api/accounts/login/")
      .withBody(body: body)
      .buildAndExecute(responseType: APILoginResponse.self, successHandler: { (response) in

        let session = Session(token: response.token)
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
