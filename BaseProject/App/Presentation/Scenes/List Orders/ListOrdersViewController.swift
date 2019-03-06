import UIKit

class ListOrdersViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: INTERNAL ATTRIBUTES
  
  var presenter: ListOrdersPresenter!
  
  // MARK: PRIVATE ATTRIBUTES
  
  private var list: ListOrganism<ImageLabelTableViewCell>?

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
    self.title = Constants.Strings.Orders.ordersTitle
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

  func relaodListWith(data: [ImageLabelCellViewData]) {
    if self.list == nil {
      self.list = ListOrganism()
      self.addChild(childViewController: self.list!, to: self.view)
    }
    self.list?.reload(with: data)
  }

  func showToast(text: String) {}
  func close() {}
}
