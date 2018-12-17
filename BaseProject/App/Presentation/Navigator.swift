import  UIKit

class Navigator {

  let viewController: UIViewController

  init(viewController: UIViewController) {
    self.viewController = viewController
  }

  func push(destination: UIViewController) {
    guard let nav = self.viewController.navigationController else {
      fatalError("Can't push without a navigation controller")
    }

    nav.pushViewController(destination, animated: true)
  }

  func present(destination: UIViewController, completion: (() -> Void)?) {
    self.viewController.present(destination, animated: true, completion: completion)
  }
}
