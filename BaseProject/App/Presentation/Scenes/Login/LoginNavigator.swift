import Foundation
import UIKit

class LoginNavigator: Navigator {

  func close(completion: (() -> Void)?) {
    self.viewController?.dismiss(animated: true, completion: completion)
  }

  func openMainView() {
    self.viewController?.dismiss(animated: true, completion: nil)
    let mainViewNav = MainNavigationViewController()
    UIApplication.shared.keyWindow?.rootViewController = mainViewNav
  }
}
