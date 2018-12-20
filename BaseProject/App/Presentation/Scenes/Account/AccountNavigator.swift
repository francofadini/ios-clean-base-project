import Foundation
import UIKit

class AccountNavigator: Navigator {
  func pushProfile() {
    self.push(destination: ProfileViewController())
  }

  func showLanding() {
    self.viewController?.dismiss(animated: true, completion: nil)
    let mainViewNav = LandingViewController()
    UIApplication.shared.keyWindow?.rootViewController = mainViewNav
  }
}
