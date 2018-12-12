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

  // MARK: INITIALIZER

  init(view: CreateOrderView) {
    self.view = view
  }

  // MARK: VIEW EVENTS

  @objc func onSubmitButtonPressed(firstName: String?) {
    self.view.showLoader()
    self.createOrderRequest.firstName = firstName
    self.createOrderInput.createOrder(requestModel: self.createOrderRequest)
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

  func onOrderCreated(responseModel: CreateOrderResponse) {
    self.view.hideLoader()
    switch responseModel.status {
    case .success:
      let orderID = responseModel.orderId!
      notifyOrderCreationSuccess(orderID: orderID)
    case .failure:
      notifyOrderCreationFailed()
    }
    self.view.close()
  }
}
