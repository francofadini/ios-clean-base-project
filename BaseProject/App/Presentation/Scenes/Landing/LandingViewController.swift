import UIKit

class LandingViewController: UIViewController {

  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var registerButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    customize()
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
}
