import Foundation

// MARK: CONFIGURATOR

protocol AccountSceneConfigurator: Configurator {
  func configure(view: AccountViewController)
}

// MARK: DEFAULT CONFIGURATOR

class AccountSceneConfiguratorImp: AccountSceneConfigurator {
  func configure(view: AccountViewController) {
    let navigator = AccountNavigator(viewController: view)
    let presenter = AccountPresenter(view: view, navigator: navigator)
    view.presenter = presenter
  }
}
