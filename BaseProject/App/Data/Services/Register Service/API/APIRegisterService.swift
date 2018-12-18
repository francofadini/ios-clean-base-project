import Foundation

// MARK: API MODELS

struct APIRegisterRequest: Codable {
  let email: String
  let password1: String
  let password2: String
}

struct APIRegisterResponse: Codable {
  let token: String
}

// MARK: SERVICE

class APIRegisterService: RegisterService {

  func register(username: String,
                password: String,
                repeatedPassword: String,
                successHandler: @escaping (Session) -> Void,
                errorHandler: @escaping (RegisterError) -> Void) {

    let body = APIRegisterRequest(email: username, password1: password, password2: repeatedPassword)

    AlamofireAPIRequestBuilder(baseURL: BASE_URL)
      .withMethod(method: .post)
      .withHeaders(headers: ["Cookie": ""])
      .withEnpoint(endpoint: "/api/accounts/register/")
      .withBody(body: body)
      .buildAndExecute(responseType: APIRegisterResponse.self, successHandler: { (response) in

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

extension APIRegisterService: RegisterGateway {
  
  func register(username: String,
                password: String,
                repeatedPassword: String,
                completion: @escaping (Session?, RegisterError?) -> Void) {

    register(username: username, password: password, repeatedPassword: repeatedPassword, successHandler: { (session) in
      completion(session, nil)
    }, errorHandler: { (error) in
      completion(nil, error)
    })
  }
}
