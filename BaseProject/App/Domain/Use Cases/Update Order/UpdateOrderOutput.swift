import Foundation

// MARK: OUTPUT BOUNDRY

protocol UpdateOrderOutput: Boundary {
  func success(response: UpdateOrderResponse)
  func failure(error: UpdateOrderError)
}

// MARK: RESPONSE MODEL

struct UpdateOrderResponse: ResponseModel {
  let order: Order
}

enum UpdateOrderError: ResponseModel {
  case other
}
