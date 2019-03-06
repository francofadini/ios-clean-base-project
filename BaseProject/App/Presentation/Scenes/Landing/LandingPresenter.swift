import Foundation

// MARK: VIEW

protocol LandingView: class {
  func hideButtons()
  func showButtos()
}

class LandingPresenter: LandingController {

  // MARK: INTERNAL

  var autologinInput: AutologinInput!
  var autologinRequest = AutologinRequest()

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
    self.autologinInput.autologin(requestModel: self.autologinRequest)
  }

  func didTapLoginButton() {
    self.navigator.presentLogin()
  }

  func didTapRegisterButton() {
    self.navigator.presentRegister()
  }
}

extension LandingPresenter: AutoLoginOutput {
  func failure(error: AutoLoginError) {
    self.view.showButtos()
  }

  func success(response: AutoLoginResponse) {
      self.navigator.presentMainView()
  }
}
