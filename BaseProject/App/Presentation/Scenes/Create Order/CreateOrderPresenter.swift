import Foundation

class CreateOrderPresenter {

  // MARK: PRIVATE ATTRIBUTES

  private var view: CreateOrderView

  // MARK: INITIALIZER

  init(view: CreateOrderView) {
    self.view = view
  }
}

extension CreateOrderPresenter: CreateOrderOutput {

  // MARK: CRETE ORDER OUTPUT

  func onOrderCreated(responseModel: CreateOrderResponse) {

  }
}
