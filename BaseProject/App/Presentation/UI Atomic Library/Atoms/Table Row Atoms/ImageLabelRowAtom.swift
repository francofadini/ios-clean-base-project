import Foundation
import UIKit

public class ImageLabelRowAtom: Row {

  private var imageView = UIImageView()
  private var label = UILabel()

  public var data = ImageLabelRowData()
  public var style: ImageLabelRowStyle = .defaultStyle

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
    self.imageView.image = data.imagePlaceholder
  }

  private func applyStyle() {
    self.label.textColor = style.labelTextColor
    self.label.font = style.labelFont
    if self.style.isImageCircular {
      self.imageView.layer.cornerRadius = (self.height - 10) / 2
      self.imageView.clipsToBounds = true
    }
  }

  private func postConfigureSubviews() {
    self.label.sizeToFit()
  }

  private func buildAtom() {
    self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor, multiplier: 1).isActive = true
    let horizontalStack = UIStackView(arrangedSubviews: [self.imageView, self.label])
    horizontalStack.spacing = 20
    self.addAutorisizingSubview(view: horizontalStack, with: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 10))
  }
}

public struct ImageLabelRowData {
  var label: String?
  var imageURL: String?
  var imagePlaceholder: UIImage?
}

public struct ImageLabelRowStyle {
  let labelTextColor: UIColor?
  let labelFont: UIFont?
  let isImageCircular: Bool

  public static var defaultStyle: ImageLabelRowStyle {
    return ImageLabelRowStyle(labelTextColor: nil,
                          labelFont: nil,
                          isImageCircular: false)
  }

  public static var defaultCircularImageStyle: ImageLabelRowStyle {
    return ImageLabelRowStyle(labelTextColor: nil,
                              labelFont: nil,
                              isImageCircular: true)
  }
}
