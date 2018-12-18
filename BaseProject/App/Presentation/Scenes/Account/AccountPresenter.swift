import Foundation

// MARK: VIEW

protocol AccountView: class {

}

class AccountPresenter {

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: AccountView!
  private var navigator: AccountNavigator!

  // MARK: INITIALIZER

  init(view: AccountView, navigator: AccountNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapProfileOption() {
    self.navigator.pushProfile()
  }

}
