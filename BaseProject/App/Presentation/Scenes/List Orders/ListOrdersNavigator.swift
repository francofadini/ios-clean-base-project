import Foundation
import UIKit

class ListOrdersNavigator: Navigator {
  func presentCreateOrderView() {
    let createOrderVC = UINavigationController(rootViewController: CreateOrderViewController())
    self.present(destination: createOrderVC, completion: nil)
  }
}
