import Foundation

protocol UpdateOrderService {
  func updateOrder(order: Order,
                   success: (Order) -> Void,
                   failure: (UpdateOrderError) -> Void)
}
