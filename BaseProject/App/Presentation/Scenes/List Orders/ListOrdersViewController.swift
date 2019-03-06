import UIKit

class ListOrdersViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: INTERNAL ATTRIBUTES
  
  var presenter: ListOrdersPresenter!
  
  // MARK: PRIVATE ATTRIBUTES
  
  private var list: ListOrganism<SimpleTableViewCell>!

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
    setupList()
  }
  
  private func setupList() {
    self.list = ListOrganism()
    addDeleteAction()
    addEditAction()
    self.addChild(childViewController: self.list!, to: self.view)
  }
  
  private func addEditAction() {
    self.list.addEditAction(action: UITableViewRowAction(
      style: .normal,
      title: Constants.Strings.General.editLabel,
      handler: { (_, indexPath) in
        let position = indexPath.row
        self.presenter.didTapEditOrderButton(at: position)
    }))
  }
  
  private func addDeleteAction() {
    self.list.addEditAction(action: UITableViewRowAction(
      style: .destructive,
      title: Constants.Strings.General.deleteLabel,
      handler: { (_, indexPath) in
        let position = indexPath.row
        self.presenter.didTapDeleteOrderButton(at: position)
    }))
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

  func relaodListWith(data: [SimpleCellViewData]) {
    self.list.reload(with: data)
  }

  func showToast(text: String) {}
  func close() {}
}
