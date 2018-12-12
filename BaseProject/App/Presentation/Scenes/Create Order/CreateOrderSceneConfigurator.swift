import Foundation

// MARK: CONTROLLER

protocol CreateOrderController {
  var createOrderInput: CreateOrderInput! {get set}
  var createOrderRequest: CreateOrderRequest {get set}
}

// MARK: CONFIGURATOR

protocol CreateOrderSceneConfigurator {
  func configure(view: CreateOrderView)
}

// MARK: DEFAULT CONFIGURATOR

class CreateOrderSceneConfiguratorImp: CreateOrderSceneConfigurator {
  func configure(view: CreateOrderView) {
    let presenter = CreateOrderPresenter(view: view)
    let datastore = OrdersRepository()
    let interactor = CreateOrderInteractor(output: presenter, datastore: datastore)
    presenter.createOrderInput = interactor
  }
}
