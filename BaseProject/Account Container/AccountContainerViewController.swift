import UIKit

class AccountContainerViewController: UIViewController {

    private let presenter: AccountContainerPresenter

    init() {
        self.presenter = AccountContainerPresenter()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: ViewController Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: Private Methods

    private func setup() {
        self.title = NSLocalizedString("Mi Cuenta", comment: "My Account container title")
    }
}
