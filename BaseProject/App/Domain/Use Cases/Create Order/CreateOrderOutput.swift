import Foundation

// MARK: OUTPUT BOUNDRY

protocol CreateOrderOutput: Boundary {
  func success(order: Order)
  func failure(error: CreateOrderError)
}

// MARK: RESPONSE MODEL

enum CreateOrderError: ResponseModel {
  case noInternet
  case unauthorized
  case other
}
