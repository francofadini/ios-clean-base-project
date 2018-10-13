import UIKit

class MainContainerViewController: UITabBarController {

    private var presenter: MainContainerPresenter!
    private var viewControllersList = [UIViewController]()

    init() {
        self.presenter = MainContainerPresenter()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.start(view: self)
    }

    // MARK: Private Methods

    private func addTabNavigationViewController(with root: UIViewController) {
        let nav = UINavigationController(rootViewController: root)
        viewControllersList.append(nav)
        viewControllers = viewControllersList
    }
}

extension MainContainerViewController: MainContainerView {
    func addAccountTab() {
        let accountContainer = AccountContainerViewController()
        let accountTabTitle = NSLocalizedString("Mi Cuenta", comment: "My Account tab title")
        accountContainer.tabBarItem = UITabBarItem(title: accountTabTitle, image: #imageLiteral(resourceName: "ic_account"), tag: 0)
        addTabNavigationViewController(with: accountContainer)
    }
}
