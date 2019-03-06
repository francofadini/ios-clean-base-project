import Foundation
import UIKit

class LandingNavigator: Navigator {
  func presentLogin() {
    let loginVC = LoginSceneConfigurator.configure()
    self.present(destination: UINavigationController(rootViewController: loginVC), completion: nil)
  }

  func presentRegister() {
    let registerVC = RegisterSceneConfigurator.configure()
    self.present(destination: UINavigationController(rootViewController: registerVC), completion: nil)
  }

  func presentMainView() {
    DispatchQueue.main.async {
      self.viewController?.dismiss(animated: false, completion: nil)
      let mainViewNav = MainNavigationSceneConfigurator.configure()
      UIApplication.shared.keyWindow?.rootViewController = mainViewNav
    }
  }
}
