import UIKit

class MainContainerViewController: UITabBarController {

    private var presenter: MainContainerPresenter!

    init() {
        self.presenter = MainContainerPresenter()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.start(view: self)
    }
}

extension MainContainerViewController: MainContainerView {

}
