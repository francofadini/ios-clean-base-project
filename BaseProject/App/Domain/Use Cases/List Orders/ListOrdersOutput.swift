import Foundation

// MARK: OUTPUT BOUNDRY

protocol ListOrdersOutput: Boundary {
  func onOrdersListed(responseModel: ListOrdersResponse)
}

// MARK: RESPONSE MODEL

struct ListOrdersResponse: ResponseModel {
  let status: ResponseStatus
  let orders: [Order]
}
