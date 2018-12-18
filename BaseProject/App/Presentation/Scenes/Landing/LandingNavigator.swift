import Foundation
import UIKit

class LandingNavigator: Navigator {
  func presentLogin() {
    let loginVC = UINavigationController(rootViewController: LoginViewController())
    self.present(destination: loginVC, completion: nil)
  }

  func presentRegister() {
    let registerVC = UINavigationController(rootViewController: RegisterViewController())
    self.present(destination: registerVC, completion: nil)
  }

  func presentMainView() {
    DispatchQueue.main.async {
      self.viewController?.dismiss(animated: false, completion: nil)
      let mainViewNav = MainNavigationViewController()
      UIApplication.shared.keyWindow?.rootViewController = mainViewNav
    }
  }
}
