import Foundation

// MARK: CONTROLLER

protocol LandingController {
  var autologinInput: AutologinInput! {get set}
  var autologinRequest: AutologinRequest {get set}
}

// MARK: CONFIGURATOR

protocol LandingSceneConfigurator: Configurator {
  func configure(view: LandingViewController)
}

// MARK: DEFAULT CONFIGURATOR

class LandingSceneConfiguratorImp: LandingSceneConfigurator {
  func configure(view: LandingViewController) {
    let navigator = LandingNavigator(viewController: view)
    let sessionService = CurrentSessionPersistantServiceLocator.defaultService
    let presenter = LandingPresenter(view: view, navigator: navigator)
    let autologinInteractor = AutoLoginInteractor(output: presenter,
                                                  sessionPersistantService: sessionService)
    presenter.autologinInput = autologinInteractor
    view.presenter = presenter
  }
}
