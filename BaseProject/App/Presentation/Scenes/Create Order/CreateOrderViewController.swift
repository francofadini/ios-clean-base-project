import UIKit

class CreateOrderViewController: UIViewController, CreateOrderController {

  // MARK: CREATE ORDER CONTROLLER

  var createOrderInput: CreateOrderInput!
  var createOrderRequest = CreateOrderRequest(identifier: nil)

  // MARK: OUTLETS

  // MARK: PRIVATE ATTRIBUTES

  private let form = FormOrganism()
  private let nameInput = TextInputAtom()

  // MARK: PUBLIC ATTRIBUTES

  // MARK: INITIALIZER

  init(configurator: CreateOrderSceneConfigurator = CreateOrderSceneConfiguratorImp()) {
    super.init(nibName: nil, bundle: nil)
    configurator.configure(controller: self, view: self)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: VIEW LIFE CYCLE

  override func viewDidLoad() {
    super.viewDidLoad()
    configureInputs()
    buildForm()
  }

  // MARK: VIEW ACTIONS

  func createOrderButtonAction() {
    self.createOrderInput.createOrder(requestModel: self.createOrderRequest)
  }

  // MARK: PRIVATE METHODS

  private func configureInputs() {
    nameInput.data.label = "Nombre y Apellido"
  }

  private func buildForm() {
    form.appendSection(inputs: [nameInput])
    self.addChild(childViewController: form, to: self.view)
  }
}

extension CreateOrderViewController: CreateOrderView {
  // MARK: CREATE ORDER VIEW
}
