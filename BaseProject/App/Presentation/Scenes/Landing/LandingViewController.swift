import UIKit

class LandingViewController: UIViewController {

  // MARK: OUTLETS

  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var registerButton: UIButton!

  // MARK: INTERNAL ATTRIBUTES

  var presenter: LandingPresenter!

  // MARK: INITIALIZER

  init(configurator: LandingSceneConfigurator = LandingSceneConfiguratorImp()) {
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
    self.presenter.didLoadView()
  }

  // MARK: PRIVATE METHODS

  private func customize() {
    self.view.backgroundColor = Constants.Colors.primaryLightColor
    self.loginButton.setTitle(Constants.Strings.Authentication.loginLabel, for: .normal)
    self.loginButton.layer.cornerRadius = self.loginButton.frame.height / 2
    self.loginButton.backgroundColor = Constants.Colors.primaryColor
    self.loginButton.setTitleColor(Constants.Colors.primaryTextColor, for: .normal)
    self.registerButton.setTitle(Constants.Strings.Authentication.registerLabel, for: .normal)
    self.registerButton.layer.cornerRadius = self.registerButton.frame.height / 2
    self.registerButton.backgroundColor = Constants.Colors.primaryColor
    self.registerButton.setTitleColor(Constants.Colors.primaryTextColor, for: .normal)
  }

  // MARK: VIEW EVENTS
  
  @IBAction func didTapLoginButton(_ sender: Any) {
    self.presenter.didTapLoginButton()
  }

  @IBAction func didTapRegisterButton(_ sender: Any) {
    self.presenter.didTapRegisterButton()
  }
}

extension LandingViewController: LandingView {

  // MARK: LANDING VIEW

  func showButtos() {
    self.loginButton.isHidden = false
    self.registerButton.isHidden = false
  }

  func hideButtons() {
    self.loginButton.isHidden = true
    self.registerButton.isHidden = true
  }
}
