import Foundation

// MARK: VIEW

protocol ListOrdersView: class {
  func showLoader()
  func hideLoader()
  func relaodListWith(data: [ImageLabelCellViewData])
  func showToast(text: String)
  func close()
}

class ListOrdersPresenter: ListOrdersController {

  // MARK: INTERNAL ATTRIBUTES
  internal var listOrdersInput: ListOrdersInput!
  internal var listOrdersRequest = ListOrdersRequest()

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
    self.listOrdersInput.listOrders(requestModel: self.listOrdersRequest)
  }

  func didTapAddOrderButton() {
    self.navigator.presentCreateOrderView(orderCreationListener: self)
  }

  // MARK: PRIVATE METHODS
  
  private func reloadList() {
    let viewDataList = orders.map { (order) -> ImageLabelCellViewData in
      return ImageLabelCellViewData(imageUrl: nil, placeholder: nil, labelText: order.firstName)
    }
    self.view.relaodListWith(data: viewDataList)
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
