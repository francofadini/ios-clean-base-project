import UIKit

class SimpleLabelCompoent: UICollectionViewCell {
    @IBOutlet weak var labelOutlet: UILabel!

    func bind(with viewData: SimpleLabelViewData?) {
        if let data = viewData {
            self.labelOutlet.text = data.labelText
        }
    }
}

class SimpleLabelViewData {
    let labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }
}
