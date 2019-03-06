import Foundation

// MARK: CONTROLLER

protocol RegisterController {
  var registerInput: RegisterInput! {get set}
  var registerRequest: RegisterRequest {get set}
}

// MARK: CONFIGURATOR

class RegisterSceneConfigurator {
  static func configure() -> RegisterViewController {
    let view = RegisterViewController()
    let navigator = RegisterNavigator(viewController: view)
    let presenter = RegisterPresenter(view: view, navigator: navigator)
    let registerService = APIRegisterService()
    let currentSessionService = CurrentSessionPersistantServiceLocator.defaultService
    let interactor = RegisterInteractor(output: presenter,
                                     registerService: registerService,
                                     sessionPersistantService: currentSessionService)
    presenter.registerInput = interactor
    view.presenter = presenter
    return view
  }
}
