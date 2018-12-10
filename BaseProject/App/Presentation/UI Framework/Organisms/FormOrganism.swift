import Foundation
import UIKit

public class FormOrganism: TableOrganism {
  init() {
    super.init(style: .grouped)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

public class InputRow: Row {

}
