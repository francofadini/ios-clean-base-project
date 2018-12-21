import UIKit

class ListOrdersViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: PRIVATE ATTRIBUTES

  //UI
  private var list: ListOrganism<ImageLabelTableViewCell>?

  // MARK: PUBLIC ATTRIBUTES

  //Presentation
  var presenter: ListOrdersPresenter!

  // MARK: INITIALIZER

  init(configurator: ListOrdersSceneConfigurator = ListOrdersSceneConfiguratorImp()) {
    super.init(nibName: nil, bundle: nil)
    configurator.configure(view: self)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addAddOrderButton()
    presenter.viewDidLoad()
  }

  // MARK: VIEW ACTIONS

  @objc func didTapAddOrderButton() {
    self.presenter.didTapAddOrderButton()
  }

  // MARK: PRIVATE METHODS

  private func configure() {
    self.title = "Ordenes"
    self.view.backgroundColor = .white
  }

  private func addAddOrderButton() {
    let submitButton = UIBarButtonItem(barButtonSystemItem: .add,
                                       target: self,
                                       action: #selector(didTapAddOrderButton))

    self.navigationItem.rightBarButtonItem = submitButton
  }

}

extension ListOrdersViewController: ListOrdersView {
  // MARK: CREATE ORDER VIEW
  func showLoader() {}
  func hideLoader() {}

  func showListWith(data: [ImageLabelCellViewData]) {
    if self.list == nil {
      self.list = ListOrganismBuilder().build()
      self.addChild(childViewController: self.list!, to: self.view)
    }
    self.list?.reload(with: data)
  }

  func showToast(text: String) {}
  func close() {}
}
