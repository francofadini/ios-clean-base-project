import Foundation

// MARK: INPUT BOUNDRY

protocol ListOrdersInput: Boundary {
  func listOrders(requestModel: ListOrdersRequest)
}

// MARK: REQUEST MODEL

struct ListOrdersRequest: RequestModel {
  let clientID: Int?

  init() {
    self.clientID = nil
  }
}
