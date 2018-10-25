import Foundation
import UIKit
import Kingfisher

class ImageComponent: BaseComponent, ImageComponentProtocol {

}

protocol ImageComponentProtocol {
    func bind(with imageView: UIImageView, and viewData: ImageComponentViewData?)
}

extension ImageComponentProtocol {
    func bind(with imageView: UIImageView, and viewData: ImageComponentViewData?) {
        if let data = viewData {
            imageView.kf.setImage(with: URL(string: data.imageURLString), placeholder: data.imagePlaceholder)
        }
    }
}

class ImageComponentViewData {
    let imageURLString: String
    let imagePlaceholder: UIImage

    init(imageURLString: String, imagePlaceholder: UIImage) {
        self.imageURLString = imageURLString
        self.imagePlaceholder = imagePlaceholder
    }
}
