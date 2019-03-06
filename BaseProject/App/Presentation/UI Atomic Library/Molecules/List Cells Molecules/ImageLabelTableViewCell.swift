import UIKit

struct ImageLabelCellViewData {
  let imageUrl: URL?
  let placeholder: UIImage?
  let labelText: String?
}

class ImageLabelTableViewCell: UITableViewCell, ListOrganismCell {
  typealias ViewDataType = ImageLabelCellViewData

  static var cellIdentifier: String = "ImageLabelTableViewCell"
  static var nibName: String?

  private let imageLabelRow = ImageLabelRowAtom()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: ImageLabelTableViewCell.cellIdentifier)
    self.contentView.addAutorisizingSubview(view: imageLabelRow)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(with viewData: ImageLabelCellViewData) -> UITableViewCell {
    self.imageLabelRow.data.label = viewData.labelText
    self.imageLabelRow.data.imagePlaceholder = viewData.placeholder
    self.imageLabelRow.layoutSubviews()
    return self
  }
}
