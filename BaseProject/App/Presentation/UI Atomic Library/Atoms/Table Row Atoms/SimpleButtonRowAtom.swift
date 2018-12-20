import Foundation
import UIKit

public class SimpleButtonRowAtom: Row {

  private var button = UIButton()

  public var data = SimpleButtonRowData()
  public var style: SimpleButtonRowStyle = .defaultStyle

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
    self.button.setTitle(self.data.title, for: .normal)
    self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }

  @objc private func didTapButton() {
    self.data.action?()
  }

  private func applyStyle() {
    self.button.setTitleColor(Constants.Colors.primaryColor, for: .normal)
  }

  private func postConfigureSubviews() {
    self.button.sizeToFit()
  }

  private func buildAtom() {
    let horizontalStack = UIStackView(arrangedSubviews: [self.button])
    horizontalStack.distribution = .fill
    self.addAutorisizingSubview(view: horizontalStack, with: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10))
  }
}

public struct SimpleButtonRowData {
  var title: String?
  var action: (() -> Void)?
}

public class SimpleButtonRowStyle {
  var titleTextColor: UIColor

  init(titleTextColor: UIColor = .black) {
    self.titleTextColor = titleTextColor
  }

  public static var defaultStyle: SimpleButtonRowStyle {
    return SimpleButtonRowStyle()
  }
}
