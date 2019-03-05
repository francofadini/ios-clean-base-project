import Foundation

// MARK: VIEW

protocol CreateOrderView: class {
  func showLoader()
  func hideLoader()
  func showToast(text: String)
  func close()
}

class CreateOrderPresenter: CreateOrderController {

  // MARK: INTERNAL ATTRIBUTES
  internal var createOrderInput: CreateOrderInput!
  internal var createOrderRequest = CreateOrderRequest()
  // MARK: PRIVATE ATTRIBUTES
  private weak var view: CreateOrderView!
  private var navigator: CreateOrderNavigator

  // MARK: INITIALIZER

  init(view: CreateOrderView, navigator: CreateOrderNavigator) {
    self.view = view
    self.navigator = navigator
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

  private func notifyOrderCreationSuccess(orderID: Int) {
    self.view.showToast(text: "La orden Nro " + String(describing: orderID) + "fué creada con éxito")
  }

  private func notifyOrderCreationFailed() {
    self.view.showToast(text: "Ocurrio un error al crear la orden")
  }

}

extension CreateOrderPresenter: CreateOrderOutput {

  // MARK: CRETE ORDER OUTPUT
  func success(order: Order) {
    self.view.hideLoader()
    notifyOrderCreationSuccess(orderID: order.identifier)
    self.view.close()
  }
  
  func failure(error: CreateOrderError) {
    self.view.hideLoader()
    notifyOrderCreationFailed()
    self.view.close()
  }
}
