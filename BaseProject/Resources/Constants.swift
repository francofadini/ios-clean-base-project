// swiftlint:disable nesting
// swiftlint:disable line_length
// swiftlint:disable identifier_name

import Foundation
import UIKit

// MARK: ENVIROMENT CONSTANTS

#if DEV
let BASE_URL = "https://dev.clingot.com"
#elseif QA
let BASE_URL = "https://stage.clingot.com"
#else // PROD
let BASE_URL = "https://app.clingot.com"
#endif

struct Constants {

  struct Colors {
    static let primaryLightColor: UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    static let primaryColor: UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    static let primaryDarkColor: UIColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)

    static let primaryTextColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let secondaryTextColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
  }

  struct Strings {

    struct General {
      static let acceptLabel = NSLocalizedString("Aceptar", comment: "General string for accept action")
      static let cancelLabel = NSLocalizedString("Cancelar", comment: "General string for cancel action")
      static let removeLabel = NSLocalizedString("Eliminar", comment: "General string for remove action")
      static let saveLabel = NSLocalizedString("Guardar", comment: "General string for save action")
      static let selectLabel = NSLocalizedString("Seleccionar", comment: "General string for select action")
      static let okDefaultAlertLabel = NSLocalizedString("OK", comment: "General string for ok action")
      static let configurationLabel = NSLocalizedString("Configuraciones", comment: "General string for configurations")
      static let loadingLabel = NSLocalizedString("Cargando...", comment: "General string for loading label")
      static let confirmLabel = NSLocalizedString("Confirmar", comment: "General string for confirm action")

      struct Errors {
        static let noInternetErrorMessage = NSLocalizedString("No hay internet", comment: "No internet general error message")
      }
    }

    struct Authentication {
      static let loginLabel = NSLocalizedString("Iniciar Sesión", comment: "Login button label")
      static let registerLabel = NSLocalizedString("Registrarme", comment: "Register button label")
      static let emailLabel = NSLocalizedString("Email", comment: "General string for email")
      static let passwordLabel = NSLocalizedString("Contraseña", comment: "General string for password")
      static let repeatPasswordLabel = NSLocalizedString("Repetir Contraseña", comment: "General string for repeat password")
      static let recoverPasswordButtonLabel = NSLocalizedString("¿Olvidaste tu contraseña?", comment: "Recover password button label")
      static let termsAndConditionsLabel = NSLocalizedString("Al registrarte, aceptas nuestras condiciones y confirmas que leíste nuestra política de datos.",
                                                             comment: "Terms and Conditions label on register screen")
      static let conditionsLabel = NSLocalizedString("condiciones", comment: "Conditions link on register screen")
      static let conditionsLink = "https://www.example.com/termsAndCond.html"
      static let politicsLabel = NSLocalizedString("política de datos", comment: "Politics link on register screen")
      static let politicsLink = "https://www.example.com/privacyPolicy.html"
      static let emailInputPlaceholder = NSLocalizedString("Email", comment: "Placeholder for email input")
      static let passwordInputPlaceholder = NSLocalizedString("Contraseña", comment: "Placeholder for password input")
      static let repeatPasswordInputPlaceholder = NSLocalizedString("Repetir Contraseña", comment: "Placeholder for repeat password input")

      struct Errors {
        static let emailValidationErrorTitle = NSLocalizedString("Email Invalido", comment: "Error title for invalid email input")
        static let emailValidationErrorMessage = NSLocalizedString("Ingrese una contraseña válida", comment: "Error message for invalid email input")
        static let passwordValidationErrorTitle = NSLocalizedString("Contraseña Invalida", comment: "Error title for invalid password input")
        static let passwordValidationErrorMessage = NSLocalizedString("Ingrese una contraseña válida", comment: "Error message for invalid password input")
        static let repeatPasswordValidationErrorTitle = NSLocalizedString("Repetir Contraseña", comment: "Error title for invalid repeat password input")
        static let repeatPasswordValidationErrorMessage = NSLocalizedString("Repita la contraseña", comment: "Error message for invalid repeat password input")
        static let passwordEqualsValidationErrorTitle = NSLocalizedString("Contraseña Invalida", comment: "Error title for passwords not equal validation")
        static let passwordEqualsValidationErrorMessage = NSLocalizedString("Las contraseñas deben coincidir", comment: "Error message for passwords not equal validation")
        static let registerErrorTitle = NSLocalizedString("Error al registrar usuario", comment: "Generic alert title for register error")
        static let registerErrorMessage = NSLocalizedString("Hubo un problema al registrar el usuario", comment: "Generic alert message for register error")
        static let loginErrorTitle = NSLocalizedString("Error al iniciar sesión", comment: "Generic alert title for login error")
        static let loginErrorMessage = NSLocalizedString("Hubo un problema al iniciar sesión", comment: "Generic alert message for login error")
      }
    }

    struct Account {
      static let accountTitle = NSLocalizedString("Mi Cuenta", comment: "Account title")
      static let profileTitle = NSLocalizedString("Mi Perfil", comment: "Profile title")
    }

    struct CRUDL {
      static let crudlTitle = NSLocalizedString("ABML", comment: "CRUDL title")
    }

  }
}
