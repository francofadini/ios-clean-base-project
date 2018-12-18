import Foundation

// MARK: CONFIGURATOR

protocol LandingSceneConfigurator: Configurator {
  func configure(view: LandingViewController)
}

// MARK: DEFAULT CONFIGURATOR

class LandingSceneConfiguratorImp: LandingSceneConfigurator {
  func configure(view: LandingViewController) {
    let navigator = LandingNavigator(viewController: view)
    let sessionService = CurrentSessionService()
    let presenter = LandingPresenter(view: view, navigator: navigator)
    let autologinInteractor = AutoLoginInteractor(output: presenter, sessionPersistantGateway: sessionService)
    presenter.autologinInput = autologinInteractor
    view.presenter = presenter
  }
}
