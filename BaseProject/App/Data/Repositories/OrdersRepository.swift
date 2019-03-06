import Foundation

class OrdersRepository: Repository {

  private let remoteService: ListOrdersService
  private let localSerivce: ListOrdersService & OrdersPersistanceService

  init(remote: ListOrdersService, local: ListOrdersService & OrdersPersistanceService) {
    self.remoteService = remote
    self.localSerivce = local
  }
}

extension OrdersRepository: CreateOrderService {
  func creteOrderWith(name: String?, success: (Order) -> Void, failure: (CreateOrderError) -> Void) {

  }
}

extension OrdersRepository: ListOrdersService {

  func listOrdersWith(clientID: Int?, success: ([Order]) -> Void, failure: (ListOrdersError) -> Void) {
    self.remoteService.listOrdersWith(clientID: clientID,
                                      success: { (orders) in
                                        
                                        localSerivce.saveOrders(orders: orders)
                                        success(orders)
                                        
                                      }, failure: { (listOrdersError) in
                                        
                                        localSerivce.listOrdersWith(clientID: clientID,
                                                                    success: { (orders) in
                                                                      
                                                                        localSerivce.saveOrders(orders: orders)
                                                                        success(orders)
                                                                      
                                                                    }, failure: { (listOrdersError) in
                                                                      
                                                                        failure(listOrdersError)
                                                                      
                                                                    })
                                      })
  }

}
