import Foundation

// MARK: CONTROLLER

protocol ProfileController {
  var loadProfileInput: LoadProfileInput! {get set}
  var loadProfileRequest: LoadProfileRequest {get set}
  var updateProfileInput: UpdateProfileInput! {get set}
  var updateProfileRequest: UpdateProfileRequest {get set}
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
    let currentSessionService = CurrentSessionPersistantServiceLocator.defaultService
    let profileService = APIUpdateProfileService(currentSessionGateway: currentSessionService)
    let updateProfileinteractor = UpdateProfileInteractor(output: presenter,
                                             updateProfileService: profileService,
                                             sessionPersistantService: currentSessionService)
    presenter.updateProfileInput = updateProfileinteractor
    let loadProfileInteractor = LoadProfileInteractor(output: presenter,
                                                      sessionPersistantService: currentSessionService)
    presenter.loadProfileInput = loadProfileInteractor
    view.presenter = presenter
  }
}
