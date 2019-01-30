import Foundation
import UIKit

public class FormOrganism: TableOrganism {

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.keyboardDismissMode = .interactive
  }
}

public class InputRow<InputValueType>: Row {
  public var value: InputValueType?

  public func fill(with value: InputValueType?) {
    self.value = value
    self.reload()
  }
}
