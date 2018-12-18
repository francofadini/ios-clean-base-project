import Foundation
import  UIKit

class AccountViewController: UIViewController {

  // MARK: PRIVATE ATTRIBUTES

  private let table = TableOrganism()
  private let profileRow = SimpleRowAtom()

  // MARK: INTERNAL ATTRIBUTES

  var presenter: AccountPresenter!

  // MARK: INITIALIZER

  init(configurator: AccountSceneConfigurator = AccountSceneConfiguratorImp()) {
    super.init(nibName: nil, bundle: nil)
    configurator.configure(view: self)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    customize()
    configureRows()
    buildTable()
  }

  // MARK: PRIVATE METHODS

  private func customize() {
    self.title = Constants.Strings.Account.accountTitle
  }

  private func configureRows() {
    profileRow.data.label = Constants.Strings.Account.profileTitle
    profileRow.accesoryType = .disclosureIndicator
  }

  private func buildTable() {
    table.appendSection(inputs: [profileRow])
    self.addChild(childViewController: table, to: self.view)
  }
}

extension AccountViewController: AccountView {
  
}
