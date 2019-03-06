import UIKit

struct SimpleCellViewData {
  let labelText: String?
}

class SimpleTableViewCell: UITableViewCell, ListOrganismCell {
  typealias ViewDataType = SimpleCellViewData
  
  static var cellIdentifier: String = "SimpleTableViewCell"
  static var nibName: String?
  
  private let simpleRow = SimpleRowAtom()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: SimpleTableViewCell.cellIdentifier)
    self.contentView.addAutorisizingSubview(view: simpleRow)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func bind(with viewData: SimpleCellViewData) -> UITableViewCell {
    self.simpleRow.data.label = viewData.labelText
    self.simpleRow.layoutSubviews()
    return self
  }
}
