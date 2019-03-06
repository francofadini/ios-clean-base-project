import Foundation

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
    let listOrdersInteractor = ListOrdersInteractor(output: presenter, listOrdersService: listOrdersService)
    let deleteOrderService = CoreDataDeleteOrderService()
    let deleteOrderInteractor = DeleteOrderInteractor(output: presenter, deleteOrderService: deleteOrderService)
    presenter.listOrdersInput = listOrdersInteractor
    presenter.deleteOrderInput = deleteOrderInteractor
    view.presenter = presenter
    return view
  }
}
