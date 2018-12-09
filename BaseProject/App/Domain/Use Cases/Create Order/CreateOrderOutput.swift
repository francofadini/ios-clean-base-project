import Foundation

// MARK: OUTPUT BOUNDRY

protocol CreateOrderOutput: Boundary {
  func onOrderCreated(responseModel: CreateOrderResponse)
}

// MARK: RESPONSE MODEL

struct CreateOrderResponse: ResponseModel {
  let status: CreateOrderResponseStatus
  let orderId: Int
}

enum CreateOrderResponseStatus {
  case success
  case failure
}
