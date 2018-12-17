import Foundation

// MARK: CONFIGURATOR

protocol LandingSceneConfigurator {
  func configure(view: LandingViewController)
}

// MARK: DEFAULT CONFIGURATOR

class LandingSceneConfiguratorImp: LandingSceneConfigurator {
  func configure(view: LandingViewController) {
    let navigator = LandingNavigator(viewController: view)
    let presenter = LandingPresenter(view: view, navigator: navigator)
    view.presenter = presenter
  }
}
