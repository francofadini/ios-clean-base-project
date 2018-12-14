import Foundation

protocol ListOrdersDatastore {
  func listOrdersWith(clientID: Int?, completion: ([Order], DataSourceError?) -> Void)
}

class ListOrdersInteractor: Interactor {
  typealias RequestModelType = ListOrdersRequest

  // MARK: PRIVATE ATTRIBUTES

  private let output: ListOrdersOutput
  private let datastore: ListOrdersDatastore

  // MARK: INITIALIZER

  init(output: ListOrdersOutput, datastore: ListOrdersDatastore) {
    self.output = output
    self.datastore = datastore
  }

  // MARK: INTERACTOR

  func execute(requestModel: ListOrdersRequest) {

    let clientID = requestModel.clientID
    var requestResponse: ListOrdersResponse!
    self.datastore.listOrdersWith(clientID: clientID) { (orders, error) in
      if error == nil {
        requestResponse = ListOrdersResponse(status: .success, orders: orders)
      } else {
        requestResponse = ListOrdersResponse(status: .failure, orders: [Order]())
      }
    }
    self.output.onOrdersListed(responseModel: requestResponse)
  }
}

extension ListOrdersInteractor: ListOrdersInput {

  // MARK: CREATE ORDER INPUT

  func listOrders(requestModel: ListOrdersRequest) {
    execute(requestModel: requestModel)
  }
}