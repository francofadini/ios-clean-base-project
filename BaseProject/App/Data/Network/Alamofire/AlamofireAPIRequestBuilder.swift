import Foundation
import Alamofire

class AlamofireAPIRequestBuilder<ResponseType: Codable>: APIRequestBuilder {

  let request: AlamofireAPIRequest<ResponseType>

  required init(baseURL: String) {
    self.request = AlamofireAPIRequest(baseURL: baseURL)
  }

  func withMethod(method: APIRequestMethod) -> APIRequestBuilder {
    switch method {
    case .get:
      self.request.method = .get
    case .post:
      self.request.method = .post
    case .put:
      self.request.method = .put
    case .patch:
      self.request.method = .patch
    case .delete:
      self.request.method = .delete
    }
    return self
  }

  func withEnpoint(endpoint: String) -> APIRequestBuilder {
    self.request.endpoint = endpoint
    return self
  }

  func withHeaders(headers: [String: String]) -> APIRequestBuilder {
    self.request.headers = headers
    return self
  }

  func withBody<BodyType>(body: BodyType) -> APIRequestBuilder where BodyType: Decodable, BodyType: Encodable {
    self.request.body = body
    return self
  }

  func withSuccessHandler<ResponseType>(
    responseType: ResponseType.Type,
    handler: @escaping (ResponseType.Type) -> Void) -> APIRequestBuilder
    where ResponseType: Codable {
      self.request.successHandler = handler as? ((Any) -> Void)
      return self
  }

  func withErrorHanlder(handler: @escaping (Int?, APIRequestError) -> Void) -> APIRequestBuilder {
    self.request.errorHandler = handler
    return self
  }

  func buildAndExecute() {
    self.request.execute()
  }
}

class AlamofireAPIRequest<RT: Codable>: APIRequest {
  typealias ResponseType = RT
  let baseURL: String
  var endpoint: String?
  var method: HTTPMethod?
  var headers: [String: String]?
  var body: Codable?
  var successHandler: ((ResponseType) -> Void)?
  var errorHandler: ((Int?, APIRequestError) -> Void)?

  init(baseURL: String) {
    self.baseURL = baseURL
  }

  func execute() {
    guard let endpoint = self.endpoint else {
      fatalError("Request endpoint must be set")
    }

    guard let method = self.method else {
      fatalError("Request method must be set")
    }

    let requestUrl = self.baseURL + endpoint
    Alamofire.request(requestUrl, method: method, headers: self.headers)
             .validate(statusCode: 200..<300)
             .responseJSON { (response) in

              switch response.result {
              case .success:

                guard let data = response.data else {
                  fatalError("Response has no data")
                }

                guard let object = try? JSONDecoder().decode(ResponseType.self, from: data) else {
                  fatalError("response couldn't be decoded as require type")
                }

                self.successHandler?(object)

              case .failure(let error):
                print(error.localizedDescription)

                if error._code == NSURLErrorTimedOut {
                  self.errorHandler?(nil, .timeout)
                  return
                }

                if error._code == NSURLErrorNotConnectedToInternet {
                  self.errorHandler?(nil, .noInternet)
                  return
                }

                if let statusCode = response.response?.statusCode {
                  self.errorHandler?(statusCode, .serverError)
                  return
                }

                self.errorHandler?(nil, .other)
              }
    }
  }
}
