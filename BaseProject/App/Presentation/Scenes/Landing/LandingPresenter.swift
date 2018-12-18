import Foundation

// MARK: VIEW

protocol LandingView: class {

}

class LandingPresenter {

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: LandingView!
  private var navigator: LandingNavigator!

  // MARK: INITIALIZER

  init(view: LandingView, navigator: LandingNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapLoginButton() {
    self.navigator.presentLogin()
  }

  func didTapRegisterButton() {
    self.navigator.openRegister()
  }
}
