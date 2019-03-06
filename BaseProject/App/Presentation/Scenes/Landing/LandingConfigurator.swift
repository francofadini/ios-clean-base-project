import Foundation

// MARK: CONTROLLER

protocol LandingController {
  var autologinInput: AutologinInput! {get set}
  var autologinRequest: AutologinRequest {get set}
}

// MARK: CONFIGURATOR

class LandingSceneConfigurator {
  static func configure() -> LandingViewController {
    let view = LandingViewController()
    let navigator = LandingNavigator(viewController: view)
    let sessionService = CurrentSessionPersistantServiceLocator.defaultService
    let presenter = LandingPresenter(view: view, navigator: navigator)
    let autologinInteractor = AutoLoginInteractor(output: presenter,
                                                  sessionPersistantService: sessionService)
    presenter.autologinInput = autologinInteractor
    view.presenter = presenter
    return view
  }
}
