// swiftlint:disable identifier_name
import Foundation

// MARK: API MODELS

struct APICreateOrderRequest: Codable {
  let title: String
}

struct APICreateOrderResponse: Codable {
  let id: Int
  let title: String
}

class APIListOrdersService: ListOrdersService {
  func listOrdersWith(clientID: Int?, success: ([Order]) -> Void, failure: (ListOrdersError) -> Void) {
    
  }
}
