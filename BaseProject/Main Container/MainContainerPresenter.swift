import Foundation

class MainContainerPresenter {

    weak var view: MainContainerView!

    init() {

    }

    func start(view: MainContainerView) {
        self.view = view
        self.view.addAccountTab()
    }
}

protocol MainContainerView: class {
    func addAccountTab()
}
