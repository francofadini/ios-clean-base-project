import Foundation

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

extension APIOrdersService: CreateOrderGateway {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (CreateOrderError) -> Void) {
    
  }
}
