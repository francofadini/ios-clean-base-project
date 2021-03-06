import UIKit

class CreateOrderViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: INTERNAL ATTRIBUTES
  
  var presenter: CreateOrderPresenter!
  
  // MARK: PRIVATE ATTRIBUTES

  private let form = FormOrganism()
  private let firstNameInput = TextInputRowAtom()
  private var submitButton: UIBarButtonItem!

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    addSubmitButton()
    configureInputs()
    buildForm()
    addCloseButton()
    self.presenter.onViewDidLoad()
  }

  // MARK: VIEW ACTIONS
  
  @objc func createOrderButtonAction() {
    self.presenter.onSubmitButtonPressed(firstName: firstNameInput.value)
  }

  @objc func didTapCloseButton() {
    presenter.didTapCloseButton()
  }

  // MARK: PRIVATE METHODS

  private func configure() {
    self.title = Constants.Strings.Orders.createOrderTitle
  }

  private func addSubmitButton() {
    self.submitButton = UIBarButtonItem(title: Constants.Strings.General.createLabel,
                                       style: .done,
                                       target: self,
                                       action: #selector(createOrderButtonAction))

    self.navigationItem.rightBarButtonItem = submitButton
  }

  private func configureInputs() {
    firstNameInput.data.label = Constants.Strings.Orders.orderNameLabel
  }

  private func buildForm() {
    form.appendSection(inputs: [firstNameInput])
    self.addChild(childViewController: form, to: self.view)
  }

  private func addCloseButton() {
    let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_close"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(didTapCloseButton))

    self.navigationItem.leftBarButtonItem = closeButton
  }
}

extension CreateOrderViewController: CreateOrderView {
  // MARK: CREATE ORDER VIEW
  func showLoader() {}
  func hideLoader() {}
  func showToast(text: String) {}
  func setNameInput(with name: String?) {
    firstNameInput.data.value = name
    firstNameInput.reload()
  }
  func setSubmitButtonTitle(title: String) {
    submitButton.title = title
  }
}
