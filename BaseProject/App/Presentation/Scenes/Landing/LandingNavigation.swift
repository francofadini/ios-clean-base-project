import Foundation

class LandingNavigator: Navigator {
  func openLogin() {
    let loginVC = LandingViewController()
    self.push(destination: loginVC)
  }

  func openRegister() {
    let registerVC = LandingViewController()
    self.push(destination: registerVC)
  }
}
