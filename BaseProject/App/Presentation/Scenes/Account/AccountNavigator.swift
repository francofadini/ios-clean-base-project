import Foundation
import UIKit

class AccountNavigator: Navigator {
  func pushProfile() {
    let profileVC = ProfileSceneConfigurator.configure()
    self.push(destination: profileVC)
  }

  func showLanding() {
    self.viewController?.dismiss(animated: true, completion: nil)
    let mainViewNav = LandingSceneConfigurator.configure()
    UIApplication.shared.keyWindow?.rootViewController = mainViewNav
  }
}
