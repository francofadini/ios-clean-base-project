import Foundation

// MARK: VIEW

protocol ProfileView: class {
  func showLoader()
  func hideLoader()
  func showError(title: String, message: String)
}

class ProfilePresenter {

  // MARK: INTERNAL ATTRIBUTES

  var profileInput: ProfileInput!
  var profileRequest = ProfileRequest()

  // MARK: PRIVATE ATTRIBUTES

  private weak var view: ProfileView!
  private var navigator: ProfileNavigator!

  // MARK: INITIALIZER

  init(view: ProfileView, navigator: ProfileNavigator) {
    self.view = view
    self.navigator = navigator
  }

  // MARK: VIEW EVENTS

  func didTapSubmitButton(firstName: String?, lastName: String?) {
    self.view.showLoader()
    self.profileRequest.firstName = firstName
    self.profileRequest.lastName = lastName
    self.profileInput.profile(requestModel: self.profileRequest)
  }

  func didTapCloseButton() {
    self.navigator.close(completion: nil)
  }
}

extension ProfilePresenter: ProfileOutput {

  // MARK: LOGIN OUTPUT

  func onLoggedIn() {
    self.view.hideLoader()
    self.navigator.openMainView()
  }

  func onProfileFail(error: ProfileError) {
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
