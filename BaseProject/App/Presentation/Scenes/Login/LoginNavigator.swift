import Foundation
import UIKit

class LoginNavigator: Navigator {
  func close(completion: (() -> Void)?) {
    self.viewController.dismiss(animated: true, completion: completion)
  }
}
