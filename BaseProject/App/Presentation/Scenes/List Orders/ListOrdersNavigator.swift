import Foundation
import UIKit

class ListOrdersNavigator: Navigator {
  func presentCreateOrderView(orderCreationListener: OrderCreationListener) {
    let createOrderVC = CreateOrderSceneConfigurator.configure(with: orderCreationListener)
    self.present(destination: UINavigationController(rootViewController: createOrderVC), completion: nil)
  }
}
