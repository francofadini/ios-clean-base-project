import UIKit

class MainNavigationViewController: UITabBarController {

  // MARK: INTERNAL ATTRIBUTES

  var presenter: MainNavigationPresenter!

  // MARK: PRIVATE ATTRIBUTES

  private let configurator: MainNavigationSceneConfigurator
  private var viewControllersList = [UIViewController]()

  // MARK: INITIALIZER

  init(configurator: MainNavigationSceneConfigurator = MainNavigationSceneConfiguratorImp()) {
    self.configurator = configurator
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configurator.configure(view: self)
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
    let myAccountContainer = AccountViewController()
    myAccountContainer.tabBarItem = UITabBarItem(title: Constants.Strings.Account.accountTitle, image: #imageLiteral(resourceName: "ic_account"), tag: 0)
    addNavigationViewControllerWith(root: myAccountContainer)
  }
}
