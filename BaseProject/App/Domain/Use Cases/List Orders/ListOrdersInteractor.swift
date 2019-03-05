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
                                            
                                            let requestResponse = ListOrdersResponse(status: .success,
                                                                                     orders: orders)
                                            
                                            self.output.onOrdersListed(responseModel: requestResponse)
    },
                                          failure: { (listOrdersError) in
                                            
                                            let requestResponse = ListOrdersResponse(status: .failure,
                                                                                     orders: [Order]())
                                            
                                            self.output.onOrdersListed(responseModel: requestResponse)
    })
  }
}

extension ListOrdersInteractor: ListOrdersInput {

  // MARK: CREATE ORDER INPUT

  func listOrders(requestModel: ListOrdersRequest) {
    execute(requestModel: requestModel)
  }
}
