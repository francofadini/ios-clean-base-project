import Foundation

class DeleteOrderInteractor: Interactor {
  typealias RequestModelType = DeleteOrderRequest
  
  // MARK: PRIVATE ATTRIBUTES
  
  private let output: DeleteOrderOutput
  private let deleteOrderService: DeleteOrderService
  
  // MARK: INITIALIZER
  
  init(output: DeleteOrderOutput,
       deleteOrderService: DeleteOrderService) {
    
    self.output = output
    self.deleteOrderService = deleteOrderService
  }
  
  // MARK: INTERACTOR
  
  func execute(requestModel: DeleteOrderRequest) {
    self.deleteOrderService.delteOrder(
      with: requestModel.orderId,
      success: {
        let response = DeleteOrderResponse(orderId: requestModel.orderId)
        self.output.success(response: response)
    }, failure: {
        self.output.failure(error: .other)
    })
  }
}

extension DeleteOrderInteractor: DeleteOrderInput {
  
  // MARK: DELETE ORDER INPUT
  
  func deleteOrder(requestModel: DeleteOrderRequest) {
      execute(requestModel: requestModel)
  }
}
