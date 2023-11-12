import UIKit
import SnapKit

class FlowLayoutCell: UICollectionViewCell {

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill

        return image
    }()

    lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    lazy var countImage: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(image)
        addSubview(imageLabel)
        addSubview(countImage)
        self.clipsToBounds = true
    }

    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.7)
            make.top.right.left.equalToSuperview()
        }

        imageLabel.snp.makeConstraints { make in
            make.width.equalTo(6)
            make.top.equalTo(image.snp.bottom).offset(15)
            make.right.left.equalToSuperview()
        }

        countImage.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(2)
            make.right.left.equalToSuperview()
        }
    }
    override func prepareForReuse() {
        self.image.image = nil
    }

    public func configure(title: String, image: UIImage, count: String) {
        self.image.image = image
        self.imageLabel.text = title
        self.countImage.text = count
    }
}
