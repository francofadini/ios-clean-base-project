import UIKit

class MainNavigationViewController: UITabBarController {

  // MARK: INTERNAL ATTRIBUTES

  var presenter: MainNavigationPresenter!

  // MARK: PRIVATE ATTRIBUTES

  private var viewControllersList = [UIViewController]()

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    customize()
    self.presenter.didLoadView()
  }

  // MARK: PRIVATE METHODS

  private func customize() {
    self.view.backgroundColor = .white
  }

  private func addNavigationViewControllerWith(root: UIViewController) {
    let nav = UINavigationController(rootViewController: root)
    viewControllersList.append(nav)
    viewControllers = viewControllersList
  }
}

extension MainNavigationViewController: MainNavigationView {
  func addAccountTab() {
    let myAccountContainer = AccountSceneConfigurator.configure()
    myAccountContainer.tabBarItem = UITabBarItem(title: Constants.Strings.Account.accountTitle, image: #imageLiteral(resourceName: "ic_account"), tag: 0)
    addNavigationViewControllerWith(root: myAccountContainer)
  }

  func addCRUDLTab() {
    let myAccountContainer = ListOrdersSceneConfigurator.configure()
    myAccountContainer.tabBarItem = UITabBarItem(title: Constants.Strings.CRUDL.crudlTitle, image: #imageLiteral(resourceName: "ic_crudl"), tag: 1)
    addNavigationViewControllerWith(root: myAccountContainer)
  }
}
