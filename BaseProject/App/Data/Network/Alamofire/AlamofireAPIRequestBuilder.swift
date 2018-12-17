import Foundation
import Alamofire

class AlamofireAPIRequestBuilder: APIRequestBuilder {

  let request: AlamofireAPIRequest

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

  func buildAndExecute<ResponseType: Codable>(responseType: ResponseType.Type,
                                              successHandler: ((ResponseType) -> Void)?,
                                              errorHandler: ((Int?, APIRequestError) -> Void)?) {
    
    self.request.execute(successHandler: successHandler, errorHandler: errorHandler)
  }
}

class AlamofireAPIRequest: APIRequest {
  let baseURL: String
  var endpoint: String?
  var method: HTTPMethod?
  var headers: [String: String]?
  var body: Codable?

  init(baseURL: String) {
    self.baseURL = baseURL
  }

  func execute<ResponseType: Codable>(successHandler: ((ResponseType) -> Void)?,
                                      errorHandler: ((Int?, APIRequestError) -> Void)?) {
    
    guard let endpoint = self.endpoint else {
      fatalError("Request endpoint must be set")
    }

    guard let method = self.method else {
      fatalError("Request method must be set")
    }

    let encoder = JSONEncoder()
    var parameters: Parameters?

    if let bodyAsParameters = try? self.body?.asDictionary(encoder: encoder) {
      parameters = bodyAsParameters
    }

    let requestUrl = self.baseURL + endpoint
    Alamofire.request(requestUrl,
                      method: method,
                      parameters: parameters,
                      encoding: JSONEncoding.default,
                      headers: self.headers)
      
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

                successHandler?(object)

              case .failure(let error):
                print(error.localizedDescription)

                if error._code == NSURLErrorTimedOut {
                  errorHandler?(nil, .timeout)
                  return
                }

                if error._code == NSURLErrorNotConnectedToInternet {
                  errorHandler?(nil, .noInternet)
                  return
                }

                if let statusCode = response.response?.statusCode {
                  errorHandler?(statusCode, .serverError)
                  return
                }

                errorHandler?(nil, .other)
              }
    }
  }
}

extension Encodable {
  func asDictionary(encoder: JSONEncoder) throws -> [String: Any] {
    let data = try encoder.encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data,
                                                            options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}
