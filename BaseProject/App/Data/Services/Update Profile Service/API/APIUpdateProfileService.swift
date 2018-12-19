import Foundation

// MARK: API MODELS

struct APIUpdateProfileRequest: Codable {
  let firstName: String
  let lastName: String
}

struct APIUpdateProfileResponse: Codable {
  let firstName: String
  let lastName: String
}

// MARK: SERVICE

class APIUpdateProfileService: UpdateProfileService {

  func updateProfile(firstName: String,
                     lastName: String,
                     successHandler: @escaping (Profile) -> Void,
                     errorHandler: @escaping (UpdateProfileError) -> Void) {

                        let body = APIUpdateProfileRequest(firstName: firstName, lastName: lastName)

                        AlamofireAPIRequestBuilder(baseURL: BASE_URL)
                          .withMethod(method: .post)
                          .withHeaders(headers: ["Cookie": ""])
                          .withEnpoint(endpoint: "/api/accounts/updateProfile/")
                          .withBody(body: body)
                          .buildAndExecute(responseType: APIUpdateProfileResponse.self, successHandler: { (response) in

                            let profile = Profile(firstName: response.firstName, lastName: response.lastName)
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
  func updateProfile(firstName: String,
                     lastName: String,
                     completion: @escaping (Profile?, UpdateProfileError?) -> Void) {

                        updateProfile(firstName: firstName, lastName: lastName, successHandler: { (profile) in

                          completion(profile, nil)

                        }, errorHandler: { (error) in

                          completion(nil, error)

                        })
  }
}
