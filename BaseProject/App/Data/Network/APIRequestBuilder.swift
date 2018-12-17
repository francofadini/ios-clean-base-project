import Foundation

protocol APIRequestBuilder {
  init(baseURL: String)
  func withMethod(method: APIRequestMethod) -> APIRequestBuilder
  func withEnpoint(endpoint: String) -> APIRequestBuilder
  func withHeaders(headers: [String: String]) -> APIRequestBuilder
  func withBody<BodyType: Codable>(body: BodyType) -> APIRequestBuilder
  func buildAndExecute<ResponseType: Codable>(responseType: ResponseType.Type,
                                              successHandler: ((ResponseType) -> Void)?,
                                              errorHandler: ((Int?, APIRequestError) -> Void)?)
}

protocol APIRequest {
  func execute<ResponseType: Codable>(successHandler: ((ResponseType) -> Void)?,
                                      errorHandler: ((Int?, APIRequestError) -> Void)?)
}

enum APIRequestError {
  case noInternet
  case timeout
  case serverError
  case other
}

public enum APIRequestMethod: String {
  case get     = "GET"
  case post    = "POST"
  case put     = "PUT"
  case patch   = "PATCH"
  case delete  = "DELETE"
}
