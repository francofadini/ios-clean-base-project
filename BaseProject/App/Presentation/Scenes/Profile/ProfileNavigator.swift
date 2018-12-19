import Foundation
import UIKit

class ProfileNavigator: Navigator {

  func close(completion: (() -> Void)?) {
    self.viewController?.navigationController?.popViewController(animated: true)
  }
}
