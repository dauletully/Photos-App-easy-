import UIKit
import SnapKit


class ViewController: UIViewController {
    private lazy var source = Source.elements

    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: Selector?.none)
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FlowLayoutCell.self, forCellWithReuseIdentifier: "cell_id")
        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photos"
        setupUI()
        setupLayout()
    }

    private func setupUI() {
        navigationItem.leftBarButtonItem = addButton
        view.addSubview(collectionView)

    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.right.left.bottom.equalToSuperview()
        }
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {
            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2),
                                                       heightDimension: .fractionalWidth(1 / 2 * 2 + 0.2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalWidth(1 / 2 + 0.1))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                //layoutSection.orthogonalScrollingBehavior = .groupPaging

                return layoutSection
            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalWidth(2 / 3))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 2.5, bottom: 0, trailing: 2.5)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                return layoutSection
//            case 2:
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                      heightDimension: .absolute(100))
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                       heightDimension: .absolute(60))
//                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: 2)
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
//
//                return layoutSection
//            case 3:
//                // Код для третьей секции
//                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                      heightDimension: .absolute(100))
//                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
//                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
//
//                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                       heightDimension: .absolute(60))
//                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
//
//                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
//                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
//
//                return layoutSection
            default:
                return nil
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return source[0].count
        case 1:
            return source[1].count
        case 2:
            return source[2].count

        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? FlowLayoutCell

        let model: Source
        switch indexPath.section {
        case 0:
            model = source[0][indexPath.item]
        case 1:
            model = source[1][indexPath.item]
        case 2:
            model = source[2][indexPath.item]
        default:
            fatalError("Unexpected section")
        }

        cell?.configure(title: model.title, image: model.photo, count: model.count)
        return cell ?? UICollectionViewCell()
    }

}
