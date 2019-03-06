import Foundation

// MARK: CONFIGURATOR

class MainNavigationSceneConfigurator {
  static func configure() -> MainNavigationViewController {
    let presenter = MainNavigationPresenter()
    let view = MainNavigationViewController(presenter: presenter)
    return view
  }
}
