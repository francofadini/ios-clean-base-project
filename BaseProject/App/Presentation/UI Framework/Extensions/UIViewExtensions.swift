import Foundation
import UIKit

extension UIView {
  func addAutorisizingSubview (view: UIView, with inset: UIEdgeInsets? = nil) {
    var subviewFrame = self.bounds
    if let subviewInset = inset {
      subviewFrame = subviewFrame.inset(by: subviewInset)
    }
    view.frame = subviewFrame
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    self.addSubview(view)
  }
}
