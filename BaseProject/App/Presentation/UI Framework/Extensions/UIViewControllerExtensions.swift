import Foundation
import UIKit

extension UIViewController {
  func addChild(childViewController: UIViewController, to view: UIView) {
    addChild(childViewController)
    view.addSubview(childViewController.view)
    childViewController.view.frame = view.bounds
    childViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    childViewController.didMove(toParent: self)
  }

  func removeFromParentVC() {
    self.willMove(toParent: nil)
    self.view.removeFromSuperview()
    self.removeFromParent()
  }
}
