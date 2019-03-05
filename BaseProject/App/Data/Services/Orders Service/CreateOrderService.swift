import Foundation

protocol CreateOrderService {
  func creteOrderWith(firstName: String?,
                      success: (Order) -> Void,
                      failure: (CreateOrderError) -> Void)
}
