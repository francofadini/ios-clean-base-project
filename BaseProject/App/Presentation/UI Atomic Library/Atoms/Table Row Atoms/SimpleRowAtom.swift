import Foundation
import UIKit

public class SimpleRowAtom: Row {

  private var label = UILabel()

  public var data = SimpleRowData()
  public var style: SimpleRowStyle = .defaultStyle

  override public func layoutSubviews() {
    super.layoutSubviews()
    preConfigureSubviews()
    bindData()
    applyStyle()
    postConfigureSubviews()
    buildAtom()
  }

  private func preConfigureSubviews() {}

  private func bindData() {
    self.label.text = data.label
  }

  private func applyStyle() {
    self.label.textColor = style.labelTextColor
    self.label.font = style.labelFont
  }

  private func postConfigureSubviews() {
    self.label.sizeToFit()
    self.label.widthAnchor.constraint(equalToConstant: self.label.frame.width).isActive = true
  }

  private func buildAtom() {
    let horizontalStack = UIStackView(arrangedSubviews: [self.label])
    horizontalStack.distribution = .fill
    self.addAutorisizingSubview(view: horizontalStack, with: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10))
  }
}

public struct SimpleRowData {
  var label: String?
}

public struct SimpleRowStyle {
  let labelTextColor: UIColor?
  let labelFont: UIFont?

  public static var defaultStyle: SimpleRowStyle {
    return SimpleRowStyle(labelTextColor: nil,
                          labelFont: nil)
  }
}
