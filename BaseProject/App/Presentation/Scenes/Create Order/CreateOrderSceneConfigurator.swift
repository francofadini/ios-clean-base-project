import Foundation

// MARK: VIEW

protocol CreateOrderView {

}

// MARK: CONTROLLER

protocol CreateOrderController {
  var createOrderInput: CreateOrderInput! {get set}
  var createOrderRequest: CreateOrderRequest {get set}
}

// MARK: CONFIGURATOR

protocol CreateOrderSceneConfigurator {
  func configure(controller: CreateOrderController, view: CreateOrderView)
}

// MARK: DEFAULT CONFIGURATOR

class CreateOrderSceneConfiguratorImp: CreateOrderSceneConfigurator {
  func configure(controller: CreateOrderController, view: CreateOrderView) {
    var controller = controller
    let presenter = CreateOrderPresenter(view: view)
    let interactor = CreateOrderInteractor(output: presenter)
    controller.createOrderInput = interactor
  }
}
