import Foundation

struct OrdersRepositoryResponse {}

class OrdersRepository {

  private let remoteService: OrdersService
  private let localSerivce: LocalOrdersService

  init(remote: OrdersService, local: LocalOrdersService) {
    self.remoteService = remote
    self.localSerivce = local
  }
}

extension OrdersRepository: CreateOrderDatasource {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (DataSourceError) -> Void) {

  }
}

extension OrdersRepository: ListOrdersDatastore {

  func listOrdersWith(clientID: Int?, completion: ([Order], DataSourceError?) -> Void) {
    self.remoteService.fetchAllOrders { (remoteResponse) in
      switch remoteResponse.status {
      case .success:
          self.localSerivce.saveOrders(orders: remoteResponse.data!)
          completion(remoteResponse.data!, nil)
      case .fail:
        self.localSerivce.fetchAllOrders(completion: { (localResponse) in
          switch localResponse.status {
          case .success:
            completion(localResponse.data!, .serverError)
          case .fail:
            completion([Order](), .localError)
          }
        })
      }
    }
  }

}
