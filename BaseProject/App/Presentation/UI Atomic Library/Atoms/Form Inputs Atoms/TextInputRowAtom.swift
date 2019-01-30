import Foundation
import UIKit

public class TextInputRowAtom: InputRow<String>, UITextFieldDelegate {

  public var data = TextInputData()
  public var style: TextInputStyle = .defaultRightAlignedStyle
  
  private var label = UILabel()
  private var textField = UITextField()

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
    self.textField.placeholder = data.placeholder
    self.textField.text = data.value
  }

  private func applyStyle() {
    self.label.textColor = style.labelTextColor
    self.label.font = style.labelFont
    self.textField.textColor = style.textFieldTextColor
    self.textField.textAlignment = style.textFieldTextAlignment
    self.textField.keyboardType = style.keyboardType
    self.textField.isSecureTextEntry = style.isSecureTextEntry
    self.textField.autocapitalizationType = style.autocapitalizationType
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

  public func textField(_ textField: UITextField,
                        shouldChangeCharactersIn range: NSRange,
                        replacementString string: String) -> Bool {

    // Hack for seeing the space when text is right aligned
    if textField.textAlignment == .right, range.location == textField.text?.count, string.elementsEqual(" ") {
      textField.text = textField.text?.appending("\u{00a0}")
      self.value = textField.text
      return false
    }

    self.value = textField.text
    return true
  }
}

public struct TextInputData {
  var label: String?
  var placeholder: String?
  var value: String?
}

public class TextInputStyle {
  let labelTextColor: UIColor?
  let labelFont: UIFont?
  let textFieldTextColor: UIColor?
  let textFieldTextAlignment: NSTextAlignment
  let keyboardType: UIKeyboardType
  let isSecureTextEntry: Bool
  let autocapitalizationType: UITextAutocapitalizationType

  init(labelTextColor: UIColor? = nil,
       labelFont: UIFont? = nil,
       textFieldTextColor: UIColor? = nil,
       textFieldTextAlignment: NSTextAlignment,
       keyboardType: UIKeyboardType = .default,
       isSecureTextEntry: Bool = false,
       autocapitalizationType: UITextAutocapitalizationType = .sentences) {

    self.labelTextColor = labelTextColor
    self.labelFont = labelFont
    self.textFieldTextColor = textFieldTextColor
    self.textFieldTextAlignment = textFieldTextAlignment
    self.keyboardType = keyboardType
    self.isSecureTextEntry = isSecureTextEntry
    self.autocapitalizationType = autocapitalizationType
  }

  public static var defaultRightAlignedStyle: TextInputStyle {
    return TextInputStyle(textFieldTextColor: .darkGray,
                          textFieldTextAlignment: .right)
  }

  public static var defaultLeftAlignedStyle: TextInputStyle {
    return TextInputStyle(textFieldTextColor: .darkGray,
                          textFieldTextAlignment: .left)
  }

  public static var defaultEmailLeftAlignedStyle: TextInputStyle {
    return TextInputStyle(textFieldTextColor: .darkGray,
                          textFieldTextAlignment: .left,
                          keyboardType: .emailAddress,
                          autocapitalizationType: .none)

  }

  public static var defaultPasswordLeftAlignedStyle: TextInputStyle {
    return TextInputStyle(textFieldTextColor: .darkGray,
                          textFieldTextAlignment: .left,
                          isSecureTextEntry: true)
  }
}
