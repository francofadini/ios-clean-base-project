import Foundation

protocol ListOrdersService: Service {
  func listOrdersWith(clientID: Int?, success: ([Order]) -> Void, failure: (ListOrdersError) -> Void)
}

protocol OrdersPersistanceService {
  func saveOrders(orders: [Order])
}

enum ListOrdersError {
  case serverError
  case localError
  case noInternet
  case unauthorized
  case other
}
