import Foundation

// MARK: CONFIGURATOR

class CreateOrderSceneConfigurator {
  static func configure(with orderCreationListener: OrderCreationListener) -> CreateOrderViewController {
    let view = CreateOrderViewController()
    let navigator = CreateOrderNavigator(viewController: view)
    let presenter = CreateOrderPresenter(view: view, navigator: navigator, orderCreationListener: orderCreationListener)
    let createOrderService = CoreDataCreateOrderService()
    let createOrderInteractor = CreateOrderInteractor(output: presenter, createOrderService: createOrderService)
    presenter.createOrderInput = createOrderInteractor
    view.presenter = presenter
    return view
  }
  
  static func configureForUpdate(order: Order,
                                 orderUpdateListener: OrderUpdateListener) -> CreateOrderViewController {
    let view = CreateOrderViewController()
    let navigator = CreateOrderNavigator(viewController: view)
    let presenter = CreateOrderPresenter(view: view,
                                         navigator: navigator,
                                         order: order,
                                         orderUpdateListener: orderUpdateListener)
    
    let createOrderService = CoreDataCreateOrderService()
    let createOrderInteractor = CreateOrderInteractor(output: presenter, createOrderService: createOrderService)
    let updateOrderService = CoreDataUpdateOrderService()
    let updateOrderInteractor = UpdateOrderInteractor(output: presenter, updateOrderService: updateOrderService)
    presenter.createOrderInput = createOrderInteractor
    presenter.updateOrderInput = updateOrderInteractor
    view.presenter = presenter
    return view
  }
}
