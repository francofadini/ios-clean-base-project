import Foundation

protocol DeleteOrderService {
  func delteOrder(with id: String, success: () -> Void, failure: () -> Void)
}
