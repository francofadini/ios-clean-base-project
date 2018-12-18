import Foundation
import UIKit

class LandingNavigator: Navigator {
  func presentLogin() {
    let loginVC = UINavigationController(rootViewController: LoginViewController())
    self.present(destination: loginVC, completion: nil)
  }

  func presentRegister() {
    // Yet not implemented
  }
}
