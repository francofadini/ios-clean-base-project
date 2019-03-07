import Foundation
import UIKit

class CreateOrderNavigator: Navigator {

  func close(completion: (() -> Void)?) {
    self.viewController?.dismiss(animated: true, completion: completion)
  }
}
