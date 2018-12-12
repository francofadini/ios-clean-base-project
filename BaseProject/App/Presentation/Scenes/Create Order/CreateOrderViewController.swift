import UIKit

class CreateOrderViewController: UIViewController {

  // MARK: OUTLETS

  // MARK: PRIVATE ATTRIBUTES

  //UI
  private let form = FormOrganism()
  private let firstNameInput = TextInputAtom()

  //Presentation
  private var presenter: CreateOrderPresenter!

  // MARK: PUBLIC ATTRIBUTES

  // MARK: INITIALIZER

  init(configurator: CreateOrderSceneConfigurator = CreateOrderSceneConfiguratorImp()) {
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
    configureInputs()
    buildForm()
  }

  // MARK: VIEW ACTIONS

  @objc func createOrderButtonAction() {
    self.presenter.onSubmitButtonPressed(firstName: firstNameInput.getValue())
  }

  // MARK: PRIVATE METHODS

  private func configure() {
    self.title = "Crear Orden"
  }

  private func addSubmitButton() {
    let submitButton = UIBarButtonItem(title: "Enviar",
                                       style: .done,
                                       target: self,
                                       action: #selector(createOrderButtonAction))

    self.navigationItem.rightBarButtonItem = submitButton
  }

  private func configureInputs() {
    firstNameInput.data.label = "Nombre"
  }

  private func buildForm() {
    form.appendSection(inputs: [firstNameInput])
    self.addChild(childViewController: form, to: self.view)
  }
}

extension CreateOrderViewController: CreateOrderView {
  // MARK: CREATE ORDER VIEW
  func showLoader() {}
  func hideLoader() {}
  func showToast(text: String) {}
  func close() {}
}
