import Foundation

protocol CreateOrderOutput: Boundary {
  func onOrderCreated(responseModel: CreateOrderResponseModel)
}

struct CreateOrderResponseModel: ResponseModel {
  let status: CreateOrderResponseStatus
  let orderId: Int
}

enum CreateOrderResponseStatus {
  case success
  case failure
}
