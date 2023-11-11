import UIKit
import SnapKit

class FlowLayoutCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit

            return image
        }()

    lazy var imageLabel: UILabel = {
           let label = UILabel()
           return label
       }()

    private let mainStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            return stack
        }()

        private let bottomStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 90
            return stack
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
            addSubview(mainStack)
            mainStack.addArrangedSubview(image)
            mainStack.addArrangedSubview(bottomStack)
            bottomStack.addArrangedSubview(imageLabel)
        self.clipsToBounds = true
        }

    private func setupConstraints() {
        mainStack.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(150)
        }

            imageLabel.snp.makeConstraints { make in
                make.width.equalTo(50)
            }
        }
    override func prepareForReuse() {
            self.image.image = nil
        }

    public func configure(title: String, image: UIImage) {
        self.image.image = image
        self.imageLabel.text = title
    }
}
