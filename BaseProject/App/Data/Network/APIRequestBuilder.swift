import Foundation

protocol APIRequestBuilder {
  init(baseURL: String)
  func withMethod(method: APIRequestMethod) -> APIRequestBuilder
  func withEnpoint(endpoint: String) -> APIRequestBuilder
  func withHeaders(headers: [String: String]) -> APIRequestBuilder
  func withBody<BodyType: Codable>(body: BodyType) -> APIRequestBuilder
  func withSuccessHandler<ResponseType: Codable>(responseType: ResponseType.Type,
                                                 handler: (ResponseType.Type) -> Void) -> APIRequestBuilder
  func withErrorHanlder(handler: (_ statusCode: Int, _ error: APIRequestError) -> Void) -> APIRequestBuilder
  func build() -> APIRequest
}

protocol APIRequest {
  func execute()
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
