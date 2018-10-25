import UIKit

class BaseComponent: UICollectionViewCell, BaseComponentProtocol {

    var viewData: BaseComponentViewData?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bind()
    }

    func bind() {}
}

protocol BaseComponentProtocol {
    var viewData: BaseComponentViewData? {get set}
    func bind()
}

class BaseComponentViewData {

}
