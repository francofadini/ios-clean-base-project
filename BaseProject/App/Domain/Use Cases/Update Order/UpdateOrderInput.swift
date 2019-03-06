import Foundation

// MARK: INPUT BOUNDRY

protocol UpdateOrderInput: Boundary {
  func updateOrder(requestModel: UpdateOrderRequest)
}

// MARK: REQUEST MODEL

struct UpdateOrderRequest: RequestModel {
  let order: Order
}
