import UIKit
import Kingfisher

class HorizontalImageLabelCollectionViewCell: UICollectionViewCell, ImageLabelView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    // MARK: Profile Header View

    func setImageURL(url: URL, placeholder: UIImage) {
        imageView.kf.setImage(with: url, placeholder: placeholder)
    }

    func setImage(image: UIImage) {
        self.imageView.image = image
    }

    func setMainLabel(text: String) {
        self.mainLabel.text = text
    }
}
