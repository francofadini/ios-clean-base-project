import Foundation

// MARK: INPUT BOUNDRY

protocol CreateOrderInput: Boundary {
  func createOrder(requestModel: CreateOrderRequest)
}

// MARK: REQUEST MODEL

struct CreateOrderRequest: RequestModel {
  let identifier: Int?
}
