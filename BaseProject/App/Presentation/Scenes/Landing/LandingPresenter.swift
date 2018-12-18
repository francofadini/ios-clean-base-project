import Foundation

// MARK: VIEW

protocol LandingView: class {
  func hideButtons()
  func showButtos()
}

class LandingPresenter {

  // MARK: INTERNAL

  var autologinInput: AutologinInput!

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: LandingView!
  private var navigator: LandingNavigator!

  // MARK: INITIALIZER

  init(view: LandingView, navigator: LandingNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didLoadView() {
    self.view.hideButtons()
    self.autologinInput.autologin(requestModel: AutologinRequest())
  }

  func didTapLoginButton() {
    self.navigator.presentLogin()
  }

  func didTapRegisterButton() {
    self.navigator.presentRegister()
  }
}

extension LandingPresenter: AutoLoginOutput {
  func onAutoLoginFail() {
    self.view.showButtos()
  }

  func onAutoLoggedIn() {
      self.navigator.presentMainView()
  }
}
