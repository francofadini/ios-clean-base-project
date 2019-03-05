import Foundation

class CreateOrderInteractor: Interactor {
  typealias RequestModelType = CreateOrderRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: CreateOrderOutput
  private let createOrderService: CreateOrderService

  // MARK: INITIALIZER

  init(output: CreateOrderOutput, createOrderService: CreateOrderService) {
    self.output = output
    self.createOrderService = createOrderService
  }

  // MARK: INTERACTOR

  func execute(requestModel: CreateOrderRequest) {

    let firstName = requestModel.firstName

    self.createOrderService.creteOrderWith(firstName: firstName,
                                           success: { (order) in
                                            self.output.success(order: order)
                                          }, failure: { (createOrderError) in
                                            self.output.failure(error: createOrderError)
                                          })
  }
}

extension CreateOrderInteractor: CreateOrderInput {

  // MARK: CREATE ORDER INPUT

  func createOrder(requestModel: CreateOrderRequest) {
    execute(requestModel: requestModel)
  }
}
