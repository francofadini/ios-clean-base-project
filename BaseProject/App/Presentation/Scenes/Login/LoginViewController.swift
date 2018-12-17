import UIKit

class LoginViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: PRIVATE ATTRIBUTES

  //UI
  private let form = FormOrganism()
  private let usernameInput = TextInputAtom()
  private let passwordInput = TextInputAtom()

  // MARK: PUBLIC ATTRIBUTES

  //Presentation
  var presenter: LoginPresenter!

  // MARK: INITIALIZER

  init(configurator: LoginSceneConfigurator = LoginSceneConfiguratorImp()) {
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
    addSubmitButton()
    addCloseButton()
    configureInputs()
    buildForm()
  }

  // MARK: VIEW ACTIONS

  @objc func didTapSubmitButton() {
    presenter.didTapSubmitButton()
  }

  @objc func didTapCloseButton() {
    presenter.didTapCloseButton()
  }

  // MARK: PRIVATE METHODS

  private func configure() {

  }

  private func addSubmitButton() {
    let submitButton = UIBarButtonItem(title: Constants.Strings.Authentication.loginLabel,
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
    usernameInput.data.label = "Email"
    passwordInput.data.label = "Contraseña"
  }

  private func buildForm() {
    form.appendSection(inputs: [usernameInput, passwordInput])
    self.addChild(childViewController: form, to: self.view)
  }
}

extension LoginViewController: LoginView {
  // MARK: CREATE ORDER VIEW
  func showLoader() {

  }

  func hideLoader() {
    
  }
}
