import UIKit

class MainNavigationViewController: UITabBarController {

  // MARK: INTERNAL ATTRIBUTES

  var presenter: MainNavigationPresenter

  // MARK: PRIVATE ATTRIBUTES

  private var viewControllersList = [UIViewController]()
  
  // MARK: INITIALIZER
  
  init(presenter: MainNavigationPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    customize()
    self.presenter.didLoadView(view: self)
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

  func addOrdersTab() {
    let myAccountContainer = ListOrdersSceneConfigurator.configure()
    myAccountContainer.tabBarItem = UITabBarItem(title: Constants.Strings.Orders.ordersTitle, image: #imageLiteral(resourceName: "ic_crudl"), tag: 1)
    addNavigationViewControllerWith(root: myAccountContainer)
  }
}
