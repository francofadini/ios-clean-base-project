import Foundation

// MARK: OUTPUT BOUNDRY

protocol ListOrdersOutput: Boundary {
  func success(orders: [Order])
  func failure(error: ListOrdersError)
}

// MARK: RESPONSE MODEL

enum ListOrdersError: ResponseModel {
  case serverError
  case localError
  case noInternet
  case unauthorized
  case other
}
