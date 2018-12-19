import Foundation

// MARK: CONTROLLER

protocol ProfileController {
  var profileInput: ProfileInput! {get set}
  var profileRequest: ProfileRequest {get set}
}

// MARK: CONFIGURATOR

protocol ProfileSceneConfigurator: Configurator {
  func configure(view: ProfileViewController)
}

// MARK: DEFAULT CONFIGURATOR

class ProfileSceneConfiguratorImp: ProfileSceneConfigurator {
  func configure(view: ProfileViewController) {
    let navigator = ProfileNavigator(viewController: view)
    let presenter = ProfilePresenter(view: view, navigator: navigator)
    let profileService = APIProfileService()
    let currentSessionService = CurrentSessionService()
    let interactor = ProfileInteractor(output: presenter,
                                     profileGateway: profileService,
                                     sessionPersistantGateway: currentSessionService)
    presenter.profileInput = interactor
    view.presenter = presenter
  }
}

