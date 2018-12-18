import Foundation

// MARK: CONTROLLER

protocol LoginController {
  var loginInput: LoginInput! {get set}
  var loginRequest: LoginRequest {get set}
}

// MARK: CONFIGURATOR

protocol LoginSceneConfigurator: Configurator {
  func configure(view: LoginViewController)
}

// MARK: DEFAULT CONFIGURATOR

class LoginSceneConfiguratorImp: LoginSceneConfigurator {
  func configure(view: LoginViewController) {
    let navigator = LoginNavigator(viewController: view)
    let presenter = LoginPresenter(view: view, navigator: navigator)
    let loginService = APILoginService()
    let currentSessionService = CurrentSessionService()
    let interactor = LoginInteractor(output: presenter,
                                     loginGateway: loginService,
                                     sessionPersistantGateway: currentSessionService)
    presenter.loginInput = interactor
    view.presenter = presenter
  }
}
