import UIKit

class RegisterViewController: UIViewController {

  // MARK: INTERNAL ATTRIBUTES
  
  var presenter: RegisterPresenter!
  
  // MARK: PRIVATE ATTRIBUTES

  private let form = FormOrganism()
  private let usernameInput = TextInputRowAtom()
  private let passwordInput = TextInputRowAtom()
  private let repeatedPasswordInput = TextInputRowAtom()

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addSubmitButton()
    addCloseButton()
    configureInputs()
    buildForm()
  }

  // MARK: VIEW EVENTS

  @objc func didTapSubmitButton() {
    presenter.didTapSubmitButton(username: usernameInput.value,
                                 password: passwordInput.value,
                                 repeatedPasword: repeatedPasswordInput.value)
  }

  @objc func didTapCloseButton() {
    presenter.didTapCloseButton()
  }

  // MARK: PRIVATE METHODS

  private func configure() {

  }

  private func addSubmitButton() {
    let submitButton = UIBarButtonItem(title: Constants.Strings.Authentication.registerLabel,
                                       style: .done,
                                       target: self,
                                       action: #selector(didTapSubmitButton))

    self.navigationItem.rightBarButtonItem = submitButton
  }

  private func addCloseButton() {
    let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_close"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(didTapCloseButton))

    self.navigationItem.leftBarButtonItem = closeButton
  }

  private func configureInputs() {
    usernameInput.style = .defaultEmailLeftAlignedStyle
    usernameInput.data.placeholder = Constants.Strings.Authentication.emailLabel
    passwordInput.style = .defaultPasswordLeftAlignedStyle
    passwordInput.data.placeholder = Constants.Strings.Authentication.passwordLabel
    repeatedPasswordInput.style = .defaultPasswordLeftAlignedStyle
    repeatedPasswordInput.data.placeholder = Constants.Strings.Authentication.repeatPasswordLabel
  }

  private func buildForm() {
    form.appendSection(inputs: [usernameInput, passwordInput, repeatedPasswordInput])
    self.addChild(childViewController: form, to: self.view)
  }
}

extension RegisterViewController: RegisterView {

  // MARK: REGISTER VIEW

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
}
