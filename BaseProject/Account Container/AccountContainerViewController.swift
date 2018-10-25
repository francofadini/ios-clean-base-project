import UIKit
import IGListKit

class AccountContainerViewController: UIViewController {

    private let presenter: AccountContainerPresenter

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    let objects = [ProfileHeaderSectionViewData(
        identifier: 0,
        imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqfYOpIsjIBpkAAR1HHsOx7gXn4tTNHca_c3N-qE-iePxJ-5pE",
        placeholder: #imageLiteral(resourceName: "profile_placeholder"),
        title: "TITLE")]

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
        self.presenter.start(view: self)
    }

    // MARK: Private Methods

    private func setup() {
        self.title = NSLocalizedString("Mi Cuenta", comment: "My Account container title")

        collectionView.frame = self.view.bounds
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .white
        self.view.addSubview(collectionView)

        self.adapter.collectionView = collectionView
        self.adapter.dataSource = self
    }
}

extension AccountContainerViewController: AccountContainerView {

}

extension AccountContainerViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return ProfileHeaderSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
