import Foundation

// MARK: VIEW

protocol MainNavigationView: class {
  func addAccountTab()
}

class MainNavigationPresenter {

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: MainNavigationView!

  // MARK: INITIALIZER

  init(view: MainNavigationView) {
    self.view = view
  }

  // MARK: VIEW EVENTS

  func didLoadView() {
    self.view.addAccountTab()
  }

}