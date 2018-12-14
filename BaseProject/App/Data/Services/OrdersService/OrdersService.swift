import Foundation

struct OrdersServiceResponse {
  let status: ServiceResponseStatus
  let data: [Order]?
}

protocol OrdersService {
  func fetchAllOrders(completion: (OrdersServiceResponse) -> Void)
}

protocol LocalOrdersService: OrdersService {
  func saveOrders(orders: [Order])
}
