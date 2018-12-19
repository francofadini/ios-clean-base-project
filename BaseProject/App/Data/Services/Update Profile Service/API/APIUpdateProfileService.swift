import Foundation

// MARK: API MODELS

struct APIUpdateProfileRequest: Codable {
  let firstName: String
  let lastName: String
}

struct APIUpdateProfileResponse: Codable {
  let identifier: Int
  let firstName: String
  let lastName: String
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
                     errorHandler: @escaping (UpdateProfileError) -> Void) {

                        let body = APIUpdateProfileRequest(firstName: firstName, lastName: lastName)

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

                            let profile = Profile(identifier: response.identifier,
                                                  firstName: response.firstName,
                                                  lastName: response.lastName)
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

extension APIUpdateProfileService: UpdateProfileGateway {
  func updateProfile(identifier: Int,
                     firstName: String,
                     lastName: String,
                     completion: @escaping (Profile?, UpdateProfileError?) -> Void) {

                        updateProfile(identifier: identifier,
                                      firstName: firstName,
                                      lastName: lastName,
                                      successHandler: { (profile) in

                                        completion(profile, nil)

                                      }, errorHandler: { (error) in

                                        completion(nil, error)

                                      })
  }
}
