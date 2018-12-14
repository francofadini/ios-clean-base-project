import UIKit

struct ImageLabelCellViewData {
  let imageUrl: URL?
  let placeholder: UIImage?
  let labelText: String?
}

class ImageLabelTableViewCell: UITableViewCell, ListOrganismCell {
  typealias ViewDataType = ImageLabelCellViewData

  static var cellIdentifier: String = "ImageLabelTableViewCell"
  static var cellHeight: CGFloat = 100

  private let imageViewAtom = UIImageView()
  private let label = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: ImageLabelTableViewCell.cellIdentifier)
    self.imageViewAtom.widthAnchor.constraint(equalTo: self.imageViewAtom.heightAnchor, multiplier: 1).isActive = true
    let horizontalStack = UIStackView(arrangedSubviews: [self.imageViewAtom, self.label])
    horizontalStack.spacing = 10
    self.contentView.addAutorisizingSubview(view: horizontalStack,
                                            with: UIEdgeInsets(top: 5.0, left: 20.0, bottom: 5.0, right: 10.0))
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func bind(with viewData: ImageLabelCellViewData) -> UITableViewCell {
    self.label.text = viewData.labelText
    self.imageViewAtom.image = viewData.placeholder
    return self
  }
}
