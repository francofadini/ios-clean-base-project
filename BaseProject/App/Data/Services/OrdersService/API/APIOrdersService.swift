import Foundation

class APIOrdersService: OrdersService {
  let requestBuilder: APIRequestBuilder = AlamofireAPIRequestBuilder(baseURL: "base_url")

  func fetchAllOrders(completion: (OrdersServiceResponse) -> Void) {
    
    let request = requestBuilder
      .withEnpoint(endpoint: "endpoint")
      .withSuccessHandler(responseType: Order.self, handler: { response in
        print(response)
      })
      .build()
    
    request.execute()
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
