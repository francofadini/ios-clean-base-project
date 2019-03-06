import Foundation

protocol CreateOrderService {
  func creteOrderWith(name: String?,
                      success: (Order) -> Void,
                      failure: (CreateOrderError) -> Void)
}
