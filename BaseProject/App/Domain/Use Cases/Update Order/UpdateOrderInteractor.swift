import Foundation

class UpdateOrderInteractor: Interactor {
  typealias RequestModelType = UpdateOrderRequest
  
  // MARK: PRIVATE ATTRIBUTES
  
  private let output: UpdateOrderOutput
  private let updateOrderService: UpdateOrderService
  
  // MARK: INITIALIZER
  
  init(output: UpdateOrderOutput,
       updateOrderService: UpdateOrderService) {
    
    self.output = output
    self.updateOrderService = updateOrderService
  }
  
  // MARK: INTERACTOR
  
  func execute(requestModel: UpdateOrderRequest) {
    self.updateOrderService.updateOrder(
      order: requestModel.order,
      success: { (order) in
        let response = UpdateOrderResponse(order: order)
        self.output.success(response: response)
    }, failure: { (updateOrderError) in
        self.output.failure(error: updateOrderError)
    })
  }
}

extension UpdateOrderInteractor: UpdateOrderInput {
  
  // MARK: Update ORDER INPUT
  
  func updateOrder(requestModel: UpdateOrderRequest) {
    execute(requestModel: requestModel)
  }
}
