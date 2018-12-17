import Foundation

// MARK: VIEW

protocol LoginView: class {
  func showLoader()
  func hideLoader()
}

class LoginPresenter {

  // MARK: INTERNAL ATTRIBUTES
  internal var loginInput: LoginInput!
  internal var loginRequest = LoginRequest()
  // MARK: PRIVATE ATTRIBUTES
  private weak var view: LoginView!
  private var navigator: LoginNavigator!

  // MARK: INITIALIZER

  init(view: LoginView, navigator: LoginNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapSubmitButton() {
    self.view.showLoader()
    self.loginInput.login(requestModel: self.loginRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }

  // MARK: PRIVATE METHODS

}

extension LoginPresenter: LoginOutput {

  // MARK: CRETE ORDER OUTPUT

  func onLoggedIn(responseModel: LoginResponse) {

  }
}
