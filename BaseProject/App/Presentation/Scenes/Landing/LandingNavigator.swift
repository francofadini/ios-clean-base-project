import Foundation
import UIKit

class LandingNavigator: Navigator {
  func openLogin() {
    let loginVC = UINavigationController(rootViewController: LoginViewController())
    self.present(destination: loginVC, completion: nil)
  }

  func openRegister() {
    
  }
}
