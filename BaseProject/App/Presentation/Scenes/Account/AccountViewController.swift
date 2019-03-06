import Foundation
import  UIKit

class AccountViewController: UIViewController {

  // MARK: INTERNAL ATTRIBUTES
  
  var presenter: AccountPresenter!
  
  // MARK: PRIVATE ATTRIBUTES

  private let table = TableOrganism()
  private let profileRow = ImageLabelRowAtom()
  private let logoutButtonRow = SimpleButtonRowAtom()

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
    profileRow.style = .defaultCircularImageStyle
    profileRow.data.label = Constants.Strings.Account.Profile.profileTitle
    profileRow.data.imagePlaceholder = #imageLiteral(resourceName: "profile_placeholder")
    profileRow.height = 100
    profileRow.accesoryType = .disclosureIndicator
    profileRow.selecctionStyle = .default
    profileRow.didTapHandler = {
      self.presenter.didTapProfileOption()
    }

    logoutButtonRow.data.title = Constants.Strings.Authentication.logoutLabel
    logoutButtonRow.style.titleTextColor = Constants.Colors.primaryColor
    logoutButtonRow.data.action = {
      self.presenter.didTapLogoutButton()
    }
  }

  private func buildTable() {
    table.appendSection(inputs: [profileRow])
    table.appendSection(inputs: [logoutButtonRow])
    self.addChild(childViewController: table, to: self.view)
  }
}

extension AccountViewController: AccountView {
  func showError(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: Constants.Strings.General.okDefaultAlertLabel, style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
