import Foundation

// MARK: CONTROLLER

protocol LoginController {
  var loginInput: LoginInput! {get set}
  var loginRequest: LoginRequest {get set}
}

// MARK: CONFIGURATOR

class LoginSceneConfigurator {
  static func configure() -> LoginViewController {
    let view = LoginViewController()
    let navigator = LoginNavigator(viewController: view)
    let presenter = LoginPresenter(view: view, navigator: navigator)
    let loginService = APILoginService()
    let currentSessionService = CurrentSessionPersistantServiceLocator.defaultService
    let interactor = LoginInteractor(output: presenter,
                                     loginService: loginService,
                                     sessionPersistantService: currentSessionService)
    presenter.loginInput = interactor
    view.presenter = presenter
    return view
  }
}
