import Foundation

// MARK: VIEW

protocol ListOrdersView: class {
  func showLoader()
  func hideLoader()
  func showListWith(data: [ImageLabelCellViewData])
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
    self.navigator.presentCreateOrderView()
  }

  // MARK: PRIVATE METHODS
}

extension ListOrdersPresenter: ListOrdersOutput {

  // MARK: LIST ORDERS OUTPUT
  
  func success(orders: [Order]) {
    self.view.hideLoader()
    let viewDataList = [ImageLabelCellViewData(imageUrl: nil, placeholder: nil, labelText: "Hola!")]
    self.view.showListWith(data: viewDataList)
  }
  
  func failure(error: ListOrdersError) {
    self.view.hideLoader()
    let viewDataList = [ImageLabelCellViewData(imageUrl: nil, placeholder: nil, labelText: "Hola!")]
    self.view.showListWith(data: viewDataList)
  }
}
