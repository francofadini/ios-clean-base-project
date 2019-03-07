import Foundation

// MARK: VIEW

protocol ListOrdersView: class {
  func showLoader()
  func hideLoader()
  func relaodListWith(data: [SimpleCellViewData])
  func showToast(text: String)
  func close()
}

class ListOrdersPresenter {

  // MARK: INTERNAL ATTRIBUTES
  var listOrdersInput: ListOrdersInput!
  var deleteOrderInput: DeleteOrderInput!

  // MARK: PRIVATE ATTRIBUTES
  private weak var view: ListOrdersView!
  private var navigator: ListOrdersNavigator
  private var orders = [Order]()

  // MARK: INITIALIZER

  init(view: ListOrdersView, navigator: ListOrdersNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func viewDidLoad() {
    self.view.showLoader()
    self.listOrdersInput.listOrders(requestModel: ListOrdersRequest())
  }

  func didTapAddOrderButton() {
    self.navigator.presentCreateOrderView(orderCreationListener: self)
  }
  
  func didTapEditOrderButton(at index: Int) {
    let order = self.orders[index]
    self.navigator.presentUpdateOrderView(order: order, orderUpdateListener: self)
  }
  
  func didTapDeleteOrderButton(at index: Int) {
    let order = self.orders[index]
    let deleteOrderRequest = DeleteOrderRequest(orderId: order.identifier)
    self.deleteOrderInput.deleteOrder(requestModel: deleteOrderRequest)
  }

  // MARK: PRIVATE METHODS
  
  private func reloadList() {
    let viewDataList = orders.map { (order) -> SimpleCellViewData in
      return SimpleCellViewData(labelText: order.firstName)
    }
    self.view.relaodListWith(data: viewDataList)
  }
  
  private func deleteOrder(with identifier: String) {
    guard let orderToDelete = self.orders.enumerated().filter({$0.element.identifier == identifier}).first else {
      return
    }
    self.orders.remove(at: orderToDelete.offset)
  }
  
  private func replaceOrder(order: Order) {
    guard let orderToReplace = self.orders.enumerated().filter({$0.element.identifier == order.identifier}).first else {
      return
    }
    self.orders.remove(at: orderToReplace.offset)
    self.orders.insert(order, at: orderToReplace.offset)
  }
}

extension ListOrdersPresenter: ListOrdersOutput {

  // MARK: LIST ORDERS OUTPUT
  
  func success(orders: [Order]) {
    self.view.hideLoader()
    self.orders = orders
    reloadList()
  }
  
  func failure(error: ListOrdersError) {
    self.view.hideLoader()
  }
}

extension ListOrdersPresenter: OrderCreationListener {
  func onOrderCreated(order: Order) {
    self.orders.insert(order, at: 0)
    reloadList()
  }
}

extension ListOrdersPresenter: DeleteOrderOutput {
  func success(response: DeleteOrderResponse) {
    deleteOrder(with: response.orderId)
    reloadList()
  }
  
  func failure(error: DeleteOrderError) {
    let errorMessage = NSLocalizedString("Ocurrio un problema al eliminar la orden",
                                         comment: "Delete order error message")
    self.view.showToast(text: errorMessage)
  }
}

extension ListOrdersPresenter: OrderUpdateListener {
  func onOrderUpdated(order: Order) {
    replaceOrder(order: order)
    reloadList()
  }
}
