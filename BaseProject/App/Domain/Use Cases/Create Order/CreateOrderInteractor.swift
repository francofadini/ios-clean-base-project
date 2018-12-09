import Foundation

class CreateOrderInteractor: Interactor {
  typealias RequestModelType = CreateOrderRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: CreateOrderOutput

  // MARK: INITIALIZER

  init(output: CreateOrderOutput) {
    self.output = output
  }

  // MARK: INTERACTOR

  func execute(requestModel: CreateOrderRequest) {
    //... steps for executing the use case
    //... create response models
    let requestResponse = CreateOrderResponse(status: .success, orderId: 0)
    self.output.onOrderCreated(responseModel: requestResponse)
  }
}

extension CreateOrderInteractor: CreateOrderInput {

  // MARK: CREATE ORDER INPUT

  func createOrder(requestModel: CreateOrderRequest) {
    execute(requestModel: requestModel)
  }
}
