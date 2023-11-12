//
//  ListCollectionCell.swift
//  Photos App
//
//  Created by Dinmukhammed Begaly on 12.11.2023.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
    
    static let identifier = "listCell_id"

    //MARK: UI elements
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.tintColor = .systemBlue

        return imageView
    }()

    private lazy var textOfCell: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray

        return label
    }()
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(imageView)
        addSubview(textOfCell)
        addSubview(countLabel)
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.centerY.equalTo(contentView)

        }

        textOfCell.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(8)
        }

        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.trailing.equalToSuperview().offset(-10)
        }
    }

    public func configure(image: UIImage, title: String, count: String) {
        imageView.image = image
        textOfCell.text = title
        countLabel.text = count
    }
}
