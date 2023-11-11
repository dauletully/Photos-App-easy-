
import UIKit

class PhotosHeader: UICollectionReusableView {
    private lazy var title: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
            return label
        }()
}
