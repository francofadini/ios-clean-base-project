import Foundation

protocol DeleteOrderService {
  func delteOrder(with identifier: String,
                  success: () -> Void,
                  failure: () -> Void)
}
