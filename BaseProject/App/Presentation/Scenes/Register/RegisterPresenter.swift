import Foundation

// MARK: VIEW

protocol RegisterView: class {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
}

class RegisterPresenter: RegisterController {

  // MARK: INTERNAL ATTRIBUTES

  var registerInput: RegisterInput!
  var registerRequest = RegisterRequest()

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: RegisterView!
  private var navigator: RegisterNavigator!

  // MARK: INITIALIZER

  init(view: RegisterView, navigator: RegisterNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapSubmitButton(username: String?, password: String?, repeatedPasword: String?) {
    self.view.showLoader()
    self.registerRequest.username = username
    self.registerRequest.password = password
    self.registerRequest.repeatedPassword = repeatedPasword
    self.registerInput.register(requestModel: self.registerRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }
}

extension RegisterPresenter: RegisterOutput {

  // MARK: REGISTER OUTPUT

  func onRegistered() {
    self.view.hideLoader()
    self.navigator.openMainView()
  }

  func onRegistrationFail(error: RegisterError) {
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
    case .emptyRepeatedPassword:
      self.view.showError(title: NSLocalizedString("Contraseña Repetida Inválida",
                                                   comment: "Invalid repeated pass error title"),
                          message: NSLocalizedString("Ingrese una contraseña repetida válida",
                                                     comment: "Invalid repeated pass error message"))
    case .passwordsNotMatch:
      self.view.showError(title: NSLocalizedString("Contraseñas No Coinciden",
                                                   comment: "Not match pass error title"),
                          message: NSLocalizedString("Asegurese de que las contraseñas coincidan",
                                                     comment: "Not match pass error message"))
    default:
      self.view.showError(title: NSLocalizedString("Error al registrarse",
                                                   comment: "Generic Register error title"),
                          message: NSLocalizedString("Ocurrio un error al registrarse",
                                                     comment: "Generic Register error message"))
    }
  }
}
