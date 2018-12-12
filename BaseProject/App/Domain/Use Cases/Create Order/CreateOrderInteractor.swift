import Foundation

protocol CreateOrderDatastore {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (Error) -> Void)
}

class CreateOrderInteractor: Interactor {
  typealias RequestModelType = CreateOrderRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: CreateOrderOutput
  private let datastore: CreateOrderDatastore

  // MARK: INITIALIZER

  init(output: CreateOrderOutput, datastore: CreateOrderDatastore) {
    self.output = output
    self.datastore = datastore
  }

  // MARK: INTERACTOR

  func execute(requestModel: CreateOrderRequest) {

    let firstName = requestModel.firstName
    var requestResponse: CreateOrderResponse!

    self.datastore.creteOrderWith(firstName: firstName, success: { (order) in
      requestResponse = CreateOrderResponse(status: .success, orderId: order.identifier)
      }, fail: { (_) in
      requestResponse = CreateOrderResponse(status: .failure, orderId: nil)
    })

    self.output.onOrderCreated(responseModel: requestResponse)
  }
}

extension CreateOrderInteractor: CreateOrderInput {

  // MARK: CREATE ORDER INPUT

  func createOrder(requestModel: CreateOrderRequest) {
    execute(requestModel: requestModel)
  }
}
