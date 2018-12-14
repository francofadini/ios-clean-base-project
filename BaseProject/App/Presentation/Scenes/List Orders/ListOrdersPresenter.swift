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

  // MARK: INITIALIZER

  init(view: ListOrdersView) {
    self.view = view
  }

  // MARK: VIEW EVENTS

  func viewDidLoad() {
    self.view.showLoader()
    self.listOrdersInput.listOrders(requestModel: self.listOrdersRequest)
  }

  // MARK: PRIVATE METHODS

}

extension ListOrdersPresenter: ListOrdersOutput {

  // MARK: LIST ORDERS OUTPUT

  func onOrdersListed(responseModel: ListOrdersResponse) {
    self.view.hideLoader()
    let viewDataList = [ImageLabelCellViewData(imageUrl: nil, placeholder: nil, labelText: "Hola!")]
    self.view.showListWith(data: viewDataList)
  }
}