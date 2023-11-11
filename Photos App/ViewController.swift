import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var source = Source.elements

    private lazy var layout = UICollectionViewFlowLayout()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FlowLayoutCell.self, forCellWithReuseIdentifier: "cell_id")
        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return source.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = source[indexPath.section][indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? FlowLayoutCell
        cell?.configure(title: model.title, image: model.photo)
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
}

