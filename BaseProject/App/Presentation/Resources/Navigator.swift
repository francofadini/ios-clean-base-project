import  UIKit

/**
 A Navigator is responsable for the app navigation. It is necessary for avoiding views knowing about data transfering.
 */

class Navigator {

  // MARK: ATTRIBUTES
  
  weak var viewController: UIViewController?

  // MARK: INITIALIZER

  init(viewController: UIViewController) {
    self.viewController = viewController
  }

  // MARK: METHODS

  func push(destination: UIViewController) {
    guard let nav = self.viewController?.navigationController else {
      fatalError("Can't push without a navigation controller")
    }

    nav.pushViewController(destination, animated: true)
  }

  func present(destination: UIViewController, completion: (() -> Void)?) {
    self.viewController?.present(destination, animated: true, completion: completion)
  }
}
