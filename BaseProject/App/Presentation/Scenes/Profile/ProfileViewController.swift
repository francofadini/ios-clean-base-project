import UIKit

class ProfileViewController: UIViewController {

  // MARK: PRIVATE ATTRIBUTES

  private let form = FormOrganism()
  private let firstNameInput = TextInputRowAtom()
  private let lastNameInput = TextInputRowAtom()

  // MARK: INTERNAL ATTRIBUTES

  var presenter: ProfilePresenter!

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addSubmitButton()
    configureInputs()
    buildForm()
    self.presenter.didLoadView()
  }

  // MARK: VIEW EVENTS

  @objc func didTapSubmitButton() {
    presenter.didTapSubmitButton(firstName: firstNameInput.value,
                                 lastName: lastNameInput.value)
  }

  @objc func didTapCloseButton() {
    presenter.didTapCloseButton()
  }

  // MARK: PRIVATE METHODS

  private func configure() {
    self.title = Constants.Strings.Account.Profile.profileTitle
  }

  private func addSubmitButton() {
    let submitButton = UIBarButtonItem(title: Constants.Strings.General.saveLabel,
                                       style: .done,
                                       target: self,
                                       action: #selector(didTapSubmitButton))

    self.navigationItem.rightBarButtonItem = submitButton
  }

  private func configureInputs() {
    firstNameInput.style = .defaultRightAlignedStyle
    firstNameInput.data.label = Constants.Strings.Account.Profile.firstNameLabel
    lastNameInput.style = .defaultRightAlignedStyle
    lastNameInput.data.label = Constants.Strings.Account.Profile.lastNameLabel
  }

  private func buildForm() {
    form.appendSection(inputs: [firstNameInput, lastNameInput])
    self.addChild(childViewController: form, to: self.view)
  }
}

extension ProfileViewController: ProfileView {

  // MARK: LOGIN VIEW

  func showLoader() {
    self.view.isUserInteractionEnabled = false
    self.navigationItem.leftBarButtonItem?.isEnabled = false
    let activityIndicator = UIActivityIndicatorView(style: .white)
    let activityIndicatorBarButton = UIBarButtonItem(customView: activityIndicator)
    self.navigationItem.setRightBarButton(activityIndicatorBarButton, animated: true)
    activityIndicator.startAnimating()
  }

  func hideLoader() {
    self.view.isUserInteractionEnabled = true
    self.navigationItem.leftBarButtonItem?.isEnabled = true
    addSubmitButton()
  }

  func showError(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: Constants.Strings.General.okDefaultAlertLabel, style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

  func fillFormWith(firstName: String?, lastName: String?) {
    firstNameInput.fill(with: firstName)
    lastNameInput.fill(with: lastName)
  }
}
