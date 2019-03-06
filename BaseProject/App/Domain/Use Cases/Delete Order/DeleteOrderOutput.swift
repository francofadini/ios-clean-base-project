import Foundation

// MARK: OUTPUT BOUNDRY

protocol DeleteOrderOutput: Boundary {
  func success(response: DeleteOrderResponse)
  func failure(error: DeleteOrderError)
}

// MARK: RESPONSE MODEL

struct DeleteOrderResponse: ResponseModel {
  let orderId: String
}

enum DeleteOrderError: ResponseModel {
  case other
}
