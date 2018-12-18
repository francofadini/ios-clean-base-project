import Foundation
import UIKit

class RegisterNavigator: Navigator {

  func close(completion: (() -> Void)?) {
    self.viewController?.dismiss(animated: true, completion: completion)
  }

  func openMainView() {
    self.viewController?.dismiss(animated: true, completion: nil)
    let mainViewNav = UINavigationController(rootViewController: ListOrdersViewController())
    UIApplication.shared.keyWindow?.rootViewController = mainViewNav
  }
}
