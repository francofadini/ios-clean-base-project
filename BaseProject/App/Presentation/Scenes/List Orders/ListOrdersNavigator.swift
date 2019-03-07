import Foundation
import UIKit

class ListOrdersNavigator: Navigator {
  func presentCreateOrderView(orderCreationListener: OrderCreationListener) {
    let createOrderVC = CreateOrderSceneConfigurator.configure(with: orderCreationListener)
    self.present(destination: UINavigationController(rootViewController: createOrderVC), completion: nil)
  }
  
  func presentUpdateOrderView(order: Order, orderUpdateListener: OrderUpdateListener) {
    let updateOrderVC = CreateOrderSceneConfigurator.configureForUpdate(order: order,
                                                                        orderUpdateListener: orderUpdateListener)
    self.present(destination: UINavigationController(rootViewController: updateOrderVC), completion: nil)
  }
}
