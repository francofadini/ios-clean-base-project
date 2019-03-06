import Foundation

// MARK: VIEW

protocol CreateOrderView: class {
  func showLoader()
  func hideLoader()
  func showToast(text: String)
  func close()
}

// MARK: ORDER CREATION LISTENER

protocol OrderCreationListener {
  func onOrderCreated(order: Order)
}

class CreateOrderPresenter: CreateOrderController {

  // MARK: INTERNAL ATTRIBUTES
  internal var createOrderInput: CreateOrderInput!
  internal var createOrderRequest = CreateOrderRequest()
  // MARK: PRIVATE ATTRIBUTES
  private weak var view: CreateOrderView!
  private var navigator: CreateOrderNavigator
  private let orderCreationListener: OrderCreationListener

  // MARK: INITIALIZER

  init(view: CreateOrderView, navigator: CreateOrderNavigator, orderCreationListener: OrderCreationListener) {
    self.view = view
    self.navigator = navigator
    self.orderCreationListener = orderCreationListener
  }

  // MARK: VIEW EVENTS

  @objc func onSubmitButtonPressed(firstName: String?) {
    self.view.showLoader()
    self.createOrderRequest.firstName = firstName
    self.createOrderInput.createOrder(requestModel: self.createOrderRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }

  // MARK: PRIVATE METHODS

  private func showOrderCreationSuccessMessage(orderID: String) {
    self.view.showToast(text: "La orden Nro " + orderID + "fué creada con éxito")
  }

  private func notifyOrderCreationFailed() {
    self.view.showToast(text: "Ocurrio un error al crear la orden")
  }

}

extension CreateOrderPresenter: CreateOrderOutput {

  // MARK: CRETE ORDER OUTPUT
  func success(order: Order) {
    self.view.hideLoader()
    showOrderCreationSuccessMessage(orderID: order.identifier)
    self.orderCreationListener.onOrderCreated(order: order)
    self.navigator.close(completion: nil)
  }
  
  func failure(error: CreateOrderError) {
    self.view.hideLoader()
    notifyOrderCreationFailed()
  }
}
