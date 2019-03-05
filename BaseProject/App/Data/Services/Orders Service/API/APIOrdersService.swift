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

class APIOrdersService: OrdersService {
  func fetchAllOrders(completion: (OrdersServiceResponse) -> Void) {
    
  }
}

extension APIOrdersService: ListOrdersGateway {
  func listOrdersWith(clientID: Int?, completion: ([Order], ListOrdersError?) -> Void) {
    fetchAllOrders { (response) in
      if response.status == .success {
        completion(response.data!, nil)
        return
      }

      completion([Order](), .serverError)
    }
  }
}
