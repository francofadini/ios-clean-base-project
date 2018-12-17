import Foundation

class APIOrdersService: OrdersService {

  func fetchAllOrders(completion: (OrdersServiceResponse) -> Void) {
    
  }
}

extension APIOrdersService: ListOrdersDatastore {
  func listOrdersWith(clientID: Int?, completion: ([Order], DataSourceError?) -> Void) {
    fetchAllOrders { (response) in
      if response.status == .success {
        completion(response.data!, nil)
        return
      }

      completion([Order](), .serverError)
    }
  }
}

extension APIOrdersService: CreateOrderDatasource {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (DataSourceError) -> Void) {
    
  }
}
