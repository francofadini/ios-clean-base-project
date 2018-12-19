import Foundation

// MARK: CONTROLLER

protocol ProfileController {
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
    let profileService = APIUpdateProfileService()
    let interactor = UpdateProfileInteractor(output: presenter,
                                             updateProfileGateway: profileService)
    presenter.updateProfileInput = interactor
    view.presenter = presenter
  }
}
