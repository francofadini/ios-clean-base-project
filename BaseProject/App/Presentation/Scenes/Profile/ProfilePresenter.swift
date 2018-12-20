import Foundation

// MARK: VIEW

protocol ProfileView: class {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
  func fillFormWith(firstName: String?, lastName: String?)
}

class ProfilePresenter: ProfileController {

  // MARK: INTERNAL ATTRIBUTES

  var updateProfileInput: UpdateProfileInput!
  var updateProfileRequest = UpdateProfileRequest()
  var loadProfileInput: LoadProfileInput!
  var loadProfileRequest = LoadProfileRequest()

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: ProfileView!
  private var navigator: ProfileNavigator!

  // MARK: INITIALIZER

  init(view: ProfileView, navigator: ProfileNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didLoadView() {
    self.loadProfileInput.loadProfile(requestModel: self.loadProfileRequest)
  }

  func didTapSubmitButton(firstName: String?, lastName: String?) {
    self.view.showLoader()
    self.updateProfileRequest.firstName = firstName
    self.updateProfileRequest.lastName = lastName
    self.updateProfileInput.updateProfile(requestModel: self.updateProfileRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }
}

extension ProfilePresenter: UpdateProfileOutput {

  // MARK: UPDATE PROFILE OUTPUT

  func onProfileUpdated() {
    self.view.hideLoader()
    self.navigator.close(completion: nil)
  }

  func onUpdateProfileFail(error: UpdateProfileError) {
    self.view.hideLoader()

    switch error {
    case .emptyFirstName:
      self.view.showError(title: NSLocalizedString("Nombre Inválido",
                                                   comment: "Invalid first name error title"),
                          message: NSLocalizedString("Ingrese un nombre válido",
                                                     comment: "Invalid first name error message"))
    case .emptyLastName:
      self.view.showError(title: NSLocalizedString("Apellido Inválido",
                                                   comment: "Invalid last name error title"),
                          message: NSLocalizedString("Ingrese un apellido válido",
                                                     comment: "Invalid last name error message"))
    default:
      self.view.showError(title: NSLocalizedString("Error al actualizar perfil",
                                                   comment: "Generic update profile error title"),
                          message: NSLocalizedString("Ocurrio un error al actualizar el perfil",
                                                     comment: "Generic update profile error message"))
    }
  }
}

extension ProfilePresenter: LoadProfileOutput {

  // MARK: LOAD PROFILE OUTPUT

  func onProfileLoaded(response: LoadProfileResponse) {
    self.view.fillFormWith(firstName: response.firstName, lastName: response.lastName)
  }

  func onLoadProfileFail(error: LoadProfileError) {
    // nothing to do here
  }
}
