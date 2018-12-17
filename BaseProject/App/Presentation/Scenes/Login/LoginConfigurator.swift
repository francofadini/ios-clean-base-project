import Foundation

// MARK: CONTROLLER

protocol LoginController {
  var loginInput: LoginInput! {get set}
  var loginRequest: LoginRequest {get set}
}

// MARK: CONFIGURATOR

protocol LoginSceneConfigurator {
  func configure(view: LoginViewController)
}

// MARK: DEFAULT CONFIGURATOR

class LoginSceneConfiguratorImp: LoginSceneConfigurator {
  func configure(view: LoginViewController) {
    let navigator = LoginNavigator(viewController: view)
    let presenter = LoginPresenter(view: view, navigator: navigator)
    let datastore = APILoginService()
    let interactor = LoginInteractor(output: presenter, datastore: datastore)
    presenter.loginInput = interactor
    view.presenter = presenter
  }
}
