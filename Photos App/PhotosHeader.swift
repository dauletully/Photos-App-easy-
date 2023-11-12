
import UIKit

class PhotosHeader: UICollectionReusableView {

    static let identifier = "cellHeader"

    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    private func setupUI() {
            addSubview(title)
        }

        private func setupLayout() {
            title.snp.makeConstraints { make in
                make.bottom.equalTo(self)
                make.left.equalTo(self)
            }
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            title.text = nil
        }
}
