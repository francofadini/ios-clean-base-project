import Foundation
import UIKit

public class TextInputAtom: InputRow {

  private var label = UILabel()
  private var textField = UITextField()

  public var data = TextInputData()
  public var style: TextInputStyle = .defaultStyle

  override public func layoutSubviews() {
    super.layoutSubviews()
    preConfigureSubviews()
    bindData()
    applyStyle()
    postConfigureSubviews()
    buildAtom()
  }

  public func getValue() -> String? {
    return self.textField.text
  }

  private func preConfigureSubviews() {}

  private func bindData() {
    self.label.text = data.label
    self.textField.placeholder = data.placeholder
    self.textField.text = data.value
  }

  private func applyStyle() {
    self.label.textColor = style.labelTextColor
    self.label.font = style.labelFont
    self.textField.textColor = style.textFieldTextColor
    self.textField.textAlignment = style.textFieldTextAlignment
  }

  private func postConfigureSubviews() {
    self.label.sizeToFit()
    self.label.widthAnchor.constraint(equalToConstant: self.label.frame.width).isActive = true
    self.textField.delegate = self
  }

  private func buildAtom() {
    let horizontalStack = UIStackView(arrangedSubviews: [self.label, self.textField])
    horizontalStack.distribution = .fill
    horizontalStack.spacing = 5
    self.addAutorisizingSubview(view: horizontalStack, with: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10))
  }
}

extension TextInputAtom: UITextFieldDelegate {
  public func textField(_ textField: UITextField,
                        shouldChangeCharactersIn range: NSRange,
                        replacementString string: String) -> Bool {

    // Hack for seeing the space when text is right aligned
    if textField.textAlignment == .right, range.location == textField.text?.count, string.elementsEqual(" ") {
      textField.text = textField.text?.appending("\u{00a0}")
      return false
    }

    return true
  }
}

public struct TextInputData {
  var label: String?
  var placeholder: String?
  var value: String?
}

public struct TextInputStyle {
  let labelTextColor: UIColor?
  let labelFont: UIFont?
  let textFieldTextColor: UIColor?
  let textFieldTextAlignment: NSTextAlignment

  public static var defaultStyle: TextInputStyle {
    return TextInputStyle(labelTextColor: nil,
                          labelFont: nil,
                          textFieldTextColor: .darkGray,
                          textFieldTextAlignment: .right)
  }
}
