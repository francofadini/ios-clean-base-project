// swiftlint:disable identifier_name

import Foundation

// MARK: API MODELS

struct APIUpdateProfileRequest: Codable {
  let first_name: String
  let last_name: String
}

struct APIUpdateProfileResponse: Codable {
  let id: Int
  let first_name: String
  let last_name: String
}

// MARK: SERVICE

class APIUpdateProfileService: UpdateProfileService {

  let currentSessionGateway: SessionPersistantGateway

  init(currentSessionGateway: SessionPersistantGateway) {
    self.currentSessionGateway = currentSessionGateway
  }

  func updateProfile(identifier: Int,
                     firstName: String,
                     lastName: String,
                     successHandler: @escaping (Profile) -> Void,
                     errorHandler: @escaping (UpdateProfileServiceError) -> Void) {

                        let body = APIUpdateProfileRequest(first_name: firstName, last_name: lastName)

                        guard let currentSession = currentSessionGateway.loadSession() else {
                          errorHandler(.unauthorized)
                          return
                        }

                        AlamofireAPIRequestBuilder(baseURL: BASE_URL)
                          .withMethod(method: .put)
                          .withHeaders(headers: ["Cookie": "", "Authorization": "JWT " + currentSession.token])
                          .withEnpoint(endpoint: "/api/users/" + String(describing: identifier) + "/")
                          .withBody(body: body)
                          .buildAndExecute(responseType: APIUpdateProfileResponse.self, successHandler: { (response) in

                            let profile = Profile(identifier: response.id,
                                                  firstName: response.first_name,
                                                  lastName: response.last_name)
                            successHandler(profile)

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
