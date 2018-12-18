import Foundation

// MARK: CONFIGURATOR

protocol MainNavigationSceneConfigurator: Configurator {
  func configure(view: MainNavigationViewController)
}

// MARK: DEFAULT CONFIGURATOR

class MainNavigationSceneConfiguratorImp: MainNavigationSceneConfigurator {
  func configure(view: MainNavigationViewController) {
    let presenter = MainNavigationPresenter(view: view)
    view.presenter = presenter
  }
}
