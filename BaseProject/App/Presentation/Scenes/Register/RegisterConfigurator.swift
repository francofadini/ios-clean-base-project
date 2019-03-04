import Foundation

// MARK: CONTROLLER

protocol RegisterController {
  var registerInput: RegisterInput! {get set}
  var registerRequest: RegisterRequest {get set}
}

// MARK: CONFIGURATOR

protocol RegisterSceneConfigurator: Configurator {
  func configure(view: RegisterViewController)
}

// MARK: DEFAULT CONFIGURATOR

class RegisterSceneConfiguratorImp: RegisterSceneConfigurator {
  func configure(view: RegisterViewController) {
    let navigator = RegisterNavigator(viewController: view)
    let presenter = RegisterPresenter(view: view, navigator: navigator)
    let registerService = APIRegisterService()
    let currentSessionService = CurrentSessionPersistantServiceLocator.defaultService
    let interactor = RegisterInteractor(output: presenter,
                                     registerGateway: registerService,
                                     sessionPersistantService: currentSessionService)
    presenter.registerInput = interactor
    view.presenter = presenter
  }
}
