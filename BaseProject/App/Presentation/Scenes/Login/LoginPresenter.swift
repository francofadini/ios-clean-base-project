import Foundation

// MARK: VIEW

protocol LoginView: class {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
}

class LoginPresenter {

  // MARK: INTERNAL ATTRIBUTES

  weak var loginInput: LoginInput!
  var loginRequest = LoginRequest()

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: LoginView!
  private var navigator: LoginNavigator!

  // MARK: INITIALIZER

  init(view: LoginView, navigator: LoginNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapSubmitButton(username: String?, password: String?) {
    self.view.showLoader()
    self.loginRequest.username = username
    self.loginRequest.password = password
    self.loginInput.login(requestModel: self.loginRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }
}

extension LoginPresenter: LoginOutput {

  // MARK: LOGIN OUTPUT

  func onLoggedIn() {
    self.view.hideLoader()
    self.navigator.openMainView()
  }

  func onLoginFail(error: LoginError) {
    self.view.hideLoader()

    switch error {
    case .emptyEmail:
      self.view.showError(title: NSLocalizedString("Email Inválido",
                                                   comment: "Invalid email error title"),
                          message: NSLocalizedString("Ingrese un email válido",
                                                     comment: "Invalid email error message"))
    case .emptyPassword:
      self.view.showError(title: NSLocalizedString("Contraseña Inválida",
                                                   comment: "Invalid pass error title"),
                          message: NSLocalizedString("Ingrese una contraseña válida",
                                                     comment: "Invalid pass error message"))
    default:
      self.view.showError(title: NSLocalizedString("Error al iniciar sesion",
                                                   comment: "Generic login error title"),
                          message: NSLocalizedString("Ocurrio un error al iniciar sesion",
                                                     comment: "Generic login error message"))
    }
  }
}
