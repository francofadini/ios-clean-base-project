import Foundation

// MARK: CONTROLLER

protocol CreateOrderController {
  var createOrderInput: CreateOrderInput! {get set}
  var createOrderRequest: CreateOrderRequest {get set}
}

// MARK: CONFIGURATOR

protocol CreateOrderSceneConfigurator {
  func configure(view: CreateOrderViewController)
}

// MARK: DEFAULT CONFIGURATOR

class CreateOrderSceneConfiguratorImp: CreateOrderSceneConfigurator {
  func configure(view: CreateOrderViewController) {
    let navigator = CreateOrderNavigator(viewController: view)
    let presenter = CreateOrderPresenter(view: view, navigator: navigator)
    let datastore = APIOrdersService()
    let interactor = CreateOrderInteractor(output: presenter, datastore: datastore)
    presenter.createOrderInput = interactor
    view.presenter = presenter
  }
}
