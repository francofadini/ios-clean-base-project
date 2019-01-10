import Foundation

// MARK: DATA GATEWAYS

protocol CreateOrderGateway {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (CreateOrderError) -> Void)
}

class CreateOrderInteractor: Interactor {
  typealias RequestModelType = CreateOrderRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: CreateOrderOutput
  private let datastore: CreateOrderGateway

  // MARK: INITIALIZER

  init(output: CreateOrderOutput, datastore: CreateOrderGateway) {
    self.output = output
    self.datastore = datastore
  }

  // MARK: INTERACTOR

  func execute(requestModel: CreateOrderRequest) {

    let firstName = requestModel.firstName

    self.datastore.creteOrderWith(firstName: firstName, success: { (order) in
      let requestResponse = CreateOrderResponse(status: .success, orderId: order.identifier)
      self.output.onOrderCreated(responseModel: requestResponse)
      }, fail: { (_) in
        let requestResponse = CreateOrderResponse(status: .failure, orderId: nil)
        self.output.onOrderCreated(responseModel: requestResponse)
    })
  }
}

extension CreateOrderInteractor: CreateOrderInput {

  // MARK: CREATE ORDER INPUT

  func createOrder(requestModel: CreateOrderRequest) {
    execute(requestModel: requestModel)
  }
}
