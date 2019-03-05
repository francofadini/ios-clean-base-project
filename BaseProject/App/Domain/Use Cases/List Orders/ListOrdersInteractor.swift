import Foundation

protocol ListOrdersGateway {
  func listOrdersWith(clientID: Int?, completion: ([Order], ListOrdersError?) -> Void)
}

class ListOrdersInteractor: Interactor {
  typealias RequestModelType = ListOrdersRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: ListOrdersOutput
  private let listOrdersService: ListOrdersService

  // MARK: INITIALIZER

  init(output: ListOrdersOutput, listOrdersService: ListOrdersService) {
    self.output = output
    self.listOrdersService = listOrdersService
  }

  // MARK: INTERACTOR

  func execute(requestModel: ListOrdersRequest) {

    let clientID = requestModel.clientID
    self.listOrdersService.listOrdersWith(clientID: clientID,
                                          success: { (orders) in
                                            self.output.success(orders: orders)
                                          }, failure: { (listOrdersError) in
                                            self.output.failure(error: listOrdersError)
                                          })
  }
}

extension ListOrdersInteractor: ListOrdersInput {

  // MARK: CREATE ORDER INPUT

  func listOrders(requestModel: ListOrdersRequest) {
    execute(requestModel: requestModel)
  }
}
