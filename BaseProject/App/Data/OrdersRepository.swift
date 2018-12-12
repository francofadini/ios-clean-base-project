import Foundation

class OrdersRepository: Repository<Order> {

}

extension OrdersRepository: CreateOrderDatastore {
  func creteOrderWith(firstName: String?, success: (Order) -> Void, fail: (Error) -> Void) {
    
  }
}
