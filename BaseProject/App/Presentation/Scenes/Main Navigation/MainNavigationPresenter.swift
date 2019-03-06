import Foundation

// MARK: VIEW

protocol MainNavigationView: class {
  func addAccountTab()
  func addOrdersTab()
}

class MainNavigationPresenter {

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: MainNavigationView!

  // MARK: VIEW EVENTS

  func didLoadView(view: MainNavigationView) {
    self.view = view
    self.view.addOrdersTab()
    self.view.addAccountTab()
  }

}
