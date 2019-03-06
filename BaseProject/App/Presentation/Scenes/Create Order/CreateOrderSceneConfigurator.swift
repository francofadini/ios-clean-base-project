import Foundation

// MARK: CONTROLLER

protocol CreateOrderController {
  var createOrderInput: CreateOrderInput! {get set}
  var createOrderRequest: CreateOrderRequest {get set}
}

// MARK: CONFIGURATOR

class CreateOrderSceneConfigurator {
  static func configure(with orderCreationListener: OrderCreationListener) -> CreateOrderViewController {
    let view = CreateOrderViewController()
    let navigator = CreateOrderNavigator(viewController: view)
    let presenter = CreateOrderPresenter(view: view, navigator: navigator, orderCreationListener: orderCreationListener)
    let createOrderService = CoreDataCreateOrderService()
    let interactor = CreateOrderInteractor(output: presenter, createOrderService: createOrderService)
    presenter.createOrderInput = interactor
    view.presenter = presenter
    return view
  }
}
