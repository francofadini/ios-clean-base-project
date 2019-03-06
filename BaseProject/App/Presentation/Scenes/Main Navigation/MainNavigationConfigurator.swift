import Foundation

// MARK: CONFIGURATOR

class MainNavigationSceneConfigurator {
  static func configure() -> MainNavigationViewController {
    let view = MainNavigationViewController()
    let presenter = MainNavigationPresenter(view: view)
    view.presenter = presenter
    return view
  }
}
