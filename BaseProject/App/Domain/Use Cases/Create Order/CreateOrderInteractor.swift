import Foundation

protocol CreateOrderDatasource {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (DataSourceError) -> Void)
}

enum DataSourceError {
  case noInternet
  case serverError
  case localError
  case other
}

class CreateOrderInteractor: Interactor {
  typealias RequestModelType = CreateOrderRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: CreateOrderOutput
  private let datastore: CreateOrderDatasource

  // MARK: INITIALIZER

  init(output: CreateOrderOutput, datastore: CreateOrderDatasource) {
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
