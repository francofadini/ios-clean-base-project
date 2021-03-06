import Foundation
import UIKit

public class DateInputRowAtom: InputRow<Date> {
  
  public var data = DateInputData()
  public var style: DateInputStyle = .defaultStyle
  public var onDoneAction: ((_ newDate: Date) -> Void)?
  
  private var label = UILabel()
  private var detailLabel = UILabel()
  private var datePicker = UIDatePicker()
  private var dummyTextField = UITextField()
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    preConfigureSubviews()
    bindData()
    applyStyle()
    postConfigureSubviews()
    buildAtom()
  }
  
  private func preConfigureSubviews() {
    
    self.didTapHandler = {
      self.onRowSelected()
    }
    
    self.dummyTextField.inputView = datePicker
    addDoneButtonOnKeyboard()
  }
  
  private func onRowSelected() {
    if self.dummyTextField.isFirstResponder {
      self.dummyTextField.resignFirstResponder()
    } else {
      self.dummyTextField.becomeFirstResponder()
    }
  }
  
  private func addDoneButtonOnKeyboard() {
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
    doneToolbar.barStyle = UIBarStyle.default
    doneToolbar.tintColor = UIApplication.shared.keyWindow?.tintColor
    
    let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                    target: nil,
                                    action: nil)
    
    let done: UIBarButtonItem = UIBarButtonItem(title: "OK",
                                                style: UIBarButtonItem.Style.done,
                                                target: self,
                                                action: #selector(onDoneButtonPressed))
    
    var items = [UIBarButtonItem]()
    items.append(flexSpace)
    items.append(done)
    
    doneToolbar.items = items
    doneToolbar.sizeToFit()
    
    self.dummyTextField.inputAccessoryView = doneToolbar
  }
  
  @objc private func onDoneButtonPressed() {
    
    self.value = self.datePicker.date
    bindDateOnDetailLabel(date: self.value!)
    
    if self.dummyTextField.isFirstResponder {
      self.dummyTextField.resignFirstResponder()
    }
    
    onDoneAction?(self.value!)
  }
  
  private func bindData() {
    self.label.text = data.label
    if let value = self.value {
      self.datePicker.setDate(value, animated: false)
      bindDateOnDetailLabel(date: value)
    } else {
      self.detailLabel.text = "-"
    }
  }
  
  private func bindDateOnDetailLabel(date: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = style.dateFormat
    self.detailLabel.text = dateFormatter.string(from: date)
  }
  
  private func applyStyle() {
    self.label.textColor = style.labelTextColor
    self.label.font = style.labelFont
    self.detailLabel.textColor = style.detailLabelTextColor
    self.detailLabel.font = style.detailLabelFont
    self.detailLabel.textAlignment = .right
    self.datePicker.datePickerMode = style.datePickerMode
  }
  
  private func postConfigureSubviews() {
    self.label.sizeToFit()
    self.label.widthAnchor.constraint(equalToConstant: self.label.frame.width).isActive = true
  }
  
  private func buildAtom() {
    self.addSubview(self.dummyTextField)
    let horizontalStack = UIStackView(arrangedSubviews: [self.label, self.detailLabel])
    horizontalStack.distribution = .fill
    horizontalStack.spacing = 5
    self.addAutorisizingSubview(view: horizontalStack, with: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10))
  }
}

public struct DateInputData {
  var label: String = "-"
}

public class DateInputStyle {
  let labelTextColor: UIColor?
  let labelFont: UIFont?
  let detailLabelTextColor: UIColor?
  let detailLabelFont: UIFont?
  let dateFormat: String
  let datePickerMode: UIDatePicker.Mode
  
  public init(labelTextColor: UIColor? = nil,
              labelFont: UIFont? = nil,
              detailLabelTextColor: UIColor? = nil,
              detailLabelFont: UIFont? = nil,
              dateFormat: String,
              datePickerMode: UIDatePicker.Mode) {
    
    self.labelTextColor = labelTextColor
    self.labelFont = labelFont
    self.detailLabelTextColor = detailLabelTextColor
    self.detailLabelFont = detailLabelFont
    self.dateFormat = dateFormat
    self.datePickerMode = datePickerMode
  }
  
  // MARK: Default styles
  
  public static var defaultStyle: DateInputStyle {
    return DateInputStyle(labelTextColor: .black,
                          detailLabelTextColor: .darkGray,
                          dateFormat: "dd/MM/yyyy",
                          datePickerMode: .date)
  }
}
