import Foundation
import IGListKit

class ProfileHeaderSectionController: ListSectionController {

    var viewData: ProfileHeaderSectionViewData?

    override func numberOfItems() -> Int {
        return 2
    }

    override func sizeForItem(at index: Int) -> CGSize {
        switch index {
        case 0:
            return CGSize(width: collectionContext!.containerSize.width, height: 150)
        case 1:
            return CGSize(width: collectionContext!.containerSize.width, height: 50)
        default:
            fatalError()
        }
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {

        switch index {
        case 0:
            guard let cell = collectionContext!.dequeueReusableCell(
                withNibName: "SimpleImageComponent",
                bundle: nil,
                for: self,
                at: index) as? SimpleImageComponent else {
                fatalError()
            }
            let imageComponentViewData = ImageComponentViewData(
                imageURLString: viewData!.imageURL,
                imagePlaceholder: viewData!.placeholder)

            cell.bind(with: <#T##UIImageView#>, and: <#T##ImageComponentViewData?#>)
            return cell
        case 1:
            guard let cell = collectionContext!.dequeueReusableCell(
                withNibName: "SimpleLabelCompoent",
                bundle: nil,
                for: self,
                at: index) as? SimpleLabelCompoent else {
                fatalError()
            }

            let simpleLabelViewData = SimpleLabelViewData(labelText: viewData!.title)
            cell.bind(with: simpleLabelViewData)
            return cell
        default:
            fatalError()
        }
    }

    override func didUpdate(to object: Any) {
        self.viewData = object as? ProfileHeaderSectionViewData
    }
}

class ProfileHeaderSectionViewData: ListDiffable {

    let identifier: Int
    let imageURL: String
    let placeholder: UIImage
    let title: String

    init(identifier: Int, imageURL: String, placeholder: UIImage, title: String) {
        self.identifier = identifier
        self.imageURL = imageURL
        self.placeholder = placeholder
        self.title = title
    }

    func diffIdentifier() -> NSObjectProtocol {
        return self.identifier as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let obj = object as? ProfileHeaderSectionViewData {
            return self.identifier == obj.identifier
        }
        return false
    }
}
