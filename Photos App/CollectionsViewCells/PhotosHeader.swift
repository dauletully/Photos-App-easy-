
import UIKit

class PhotosHeader: UICollectionReusableView {

    static let identifier = "header_id"
    //MARK: - UI elements
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
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
    //MARK: - setup functions
    private func setupUI() {
        addSubview(title)
    }

    private func setupLayout() {
        title.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    //MARK: - other functios
    public func configure(text: String) {
        title.text = text
    }
}
