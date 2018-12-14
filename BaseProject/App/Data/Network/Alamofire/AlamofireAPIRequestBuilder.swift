import Foundation

class AlamofireAPIRequestBuilder: APIRequestBuilder {

  required init(baseURL: String) {

  }

  func withMethod(method: APIRequestMethod) -> APIRequestBuilder {
    return self
  }

  func withEnpoint(endpoint: String) -> APIRequestBuilder {
    return self
  }

  func withHeaders(headers: [String: String]) -> APIRequestBuilder {
    return self
  }

  func withBody<BodyType>(body: BodyType) -> APIRequestBuilder where BodyType: Decodable, BodyType: Encodable {
    return self
  }

  func withResponseType<ResponseType>(responseType: ResponseType.Type) -> APIRequestBuilder
    where ResponseType: Codable {

    return self
  }

  func withSuccessHandler<ResponseType>(
    responseType: ResponseType.Type,
    handler: (ResponseType.Type) -> Void) -> APIRequestBuilder
    where ResponseType: Codable {
      return self
  }

  func withErrorHanlder(handler: (Int, APIRequestError) -> Void) -> APIRequestBuilder {
    return self
  }

  func build() -> APIRequest {
    return AlamofireAPIRequest()
  }
}

class AlamofireAPIRequest: APIRequest {
  func execute() {

  }
}
