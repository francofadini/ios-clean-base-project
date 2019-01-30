import Foundation
import UIKit

public class FormOrganism: TableOrganism {

  public override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.keyboardDismissMode = .interactive
  }
}

public class InputRow<InputValueType>: Row {
  var value: InputValueType?

  func fill(with value: InputValueType?) {
    self.value = value
    self.reload()
  }
}
