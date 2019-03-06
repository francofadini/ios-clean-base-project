import Foundation

// MARK: INPUT BOUNDRY

protocol DeleteOrderInput: Boundary {
  func deleteOrder(requestModel: DeleteOrderRequest)
}

// MARK: REQUEST MODEL

struct DeleteOrderRequest: RequestModel {
  let orderId: String
}
