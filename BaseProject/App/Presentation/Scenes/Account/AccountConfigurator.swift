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
    let currentSessionService = CurrentSessionService()
    let logoutInteractor = LogoutInteractor(output: presenter, sessionPersistantGateway: currentSessionService)
    presenter.logoutInput = logoutInteractor
    view.presenter = presenter
  }
}
