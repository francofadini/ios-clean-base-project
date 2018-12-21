import Foundation

// MARK: CONTROLLER

protocol ListOrdersController {
  var listOrdersInput: ListOrdersInput! {get set}
  var listOrdersRequest: ListOrdersRequest {get set}
}

// MARK: CONFIGURATOR

protocol ListOrdersSceneConfigurator {
  func configure(view: ListOrdersViewController)
}

// MARK: DEFAULT CONFIGURATOR

class ListOrdersSceneConfiguratorImp: ListOrdersSceneConfigurator {
  func configure(view: ListOrdersViewController) {
    let navigator = ListOrdersNavigator(viewController: view)
    let presenter = ListOrdersPresenter(view: view, navigator: navigator)
    let datastore = APIOrdersService()
    let interactor = ListOrdersInteractor(output: presenter, datastore: datastore)
    presenter.listOrdersInput = interactor
    view.presenter = presenter
  }
}
