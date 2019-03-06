import Foundation

// MARK: CONTROLLER

protocol ListOrdersController {
  var listOrdersInput: ListOrdersInput! {get set}
  var listOrdersRequest: ListOrdersRequest {get set}
}

// MARK: CONFIGURATOR

class ListOrdersSceneConfigurator {
  static func configure() -> ListOrdersViewController {
    let view = ListOrdersViewController()
    let navigator = ListOrdersNavigator(viewController: view)
    let presenter = ListOrdersPresenter(view: view, navigator: navigator)
    let remoteListOrdersService = APIListOrdersService()
    let localListOrdersService = CoreDataListOrdersService()
    let ordersPersistanceService = CoreDataOrdersPersistanceService()
    let listOrdersService = OrdersRepository(remote: remoteListOrdersService,
                                             local: localListOrdersService,
                                             ordersPersistanceService: ordersPersistanceService)
    let interactor = ListOrdersInteractor(output: presenter, listOrdersService: listOrdersService)
    presenter.listOrdersInput = interactor
    view.presenter = presenter
    return view
  }
}
