import Foundation

// MARK: CONFIGURATOR

class AccountSceneConfigurator {
  static func configure() -> AccountViewController {
    let view = AccountViewController()
    let navigator = AccountNavigator(viewController: view)
    let presenter = AccountPresenter(view: view, navigator: navigator)
    let currentSessionService = CurrentSessionPersistantServiceLocator.defaultService
    let logoutInteractor = LogoutInteractor(output: presenter,
                                            sessionPersistantService: currentSessionService)
    presenter.logoutInput = logoutInteractor
    view.presenter = presenter
    return view
  }
}
