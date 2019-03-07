import Foundation

// MARK: VIEW

protocol CreateOrderView: class {
  func showLoader()
  func hideLoader()
  func showToast(text: String)
  func setNameInput(with name: String?)
  func setSubmitButtonTitle(title: String)
}

// MARK: ORDER CREATION LISTENER

protocol OrderCreationListener {
  func onOrderCreated(order: Order)
}

protocol OrderUpdateListener {
  func onOrderUpdated(order: Order)
}

class CreateOrderPresenter {

  // MARK: INTERNAL ATTRIBUTES
  var createOrderInput: CreateOrderInput!
  var updateOrderInput: UpdateOrderInput!
  
  // MARK: PRIVATE ATTRIBUTES
  private weak var view: CreateOrderView!
  private var navigator: CreateOrderNavigator
  private var orderCreationListener: OrderCreationListener?
  private var orderUpdateListener: OrderUpdateListener?
  private var order: Order?

  // MARK: INITIALIZER

  init(view: CreateOrderView, navigator: CreateOrderNavigator, orderCreationListener: OrderCreationListener) {
    self.view = view
    self.navigator = navigator
    self.orderCreationListener = orderCreationListener
  }
  
  init(view: CreateOrderView, navigator: CreateOrderNavigator, order: Order, orderUpdateListener: OrderUpdateListener) {
    self.view = view
    self.navigator = navigator
    self.order = order
    self.orderUpdateListener = orderUpdateListener
  }

  // MARK: VIEW EVENTS
  
  func onViewDidLoad() {
    if isEditing() {
      self.view.setSubmitButtonTitle(title: Constants.Strings.General.saveLabel)
      fillForm(with: self.order!)
    } else {
      self.view.setSubmitButtonTitle(title: Constants.Strings.General.createLabel)
    }
  }

  @objc func onSubmitButtonPressed(firstName: String?) {
    if isEditing() {
      updateOrder(firstName: firstName)
    } else {
      createOrder(firstName: firstName)
    }
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }

  // MARK: PRIVATE METHODS
  
  private func fillForm(with order: Order) {
    self.view.setNameInput(with: order.firstName)
  }
  
  private func createOrder(firstName: String?) {
    self.view.showLoader()
    var request = CreateOrderRequest()
    request.firstName = firstName
    self.createOrderInput.createOrder(requestModel: request)
  }
  
  private func updateOrder(firstName: String?) {
    self.view.showLoader()
    self.order!.firstName = firstName
    let request = UpdateOrderRequest(order: self.order!)
    updateOrderInput.updateOrder(requestModel: request)
  }

  private func isEditing() -> Bool {
    return orderUpdateListener != nil
  }
}

extension CreateOrderPresenter: CreateOrderOutput {

  // MARK: CRETE ORDER OUTPUT
  func success(order: Order) {
    self.view.hideLoader()
    self.orderCreationListener?.onOrderCreated(order: order)
    self.navigator.close(completion: nil)
  }
  
  func failure(error: CreateOrderError) {
    self.view.hideLoader()
    self.view.showToast(text: "Ocurrio un error al crear la orden")
  }
}

extension CreateOrderPresenter: UpdateOrderOutput {
  func success(response: UpdateOrderResponse) {
    self.view.hideLoader()
    self.orderUpdateListener?.onOrderUpdated(order: response.order)
    self.navigator.close(completion: nil)
  }
  
  func failure(error: UpdateOrderError) {
    self.view.hideLoader()
    self.view.showToast(text: "Ocurrio un error al editar la orden")
  }
}
