import UIKit
import SnapKit


class ViewController: UIViewController {

    private lazy var source = Source.elements
    //MARK: - UI elements
    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: Selector?.none)
        return button
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FlowLayoutCell.self, forCellWithReuseIdentifier: "cell_id")
        collectionView.register(ListCollectionCell.self, forCellWithReuseIdentifier: ListCollectionCell.identifier)
        collectionView.register(PhotosHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PhotosHeader.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    //MARK: - Setup functions
    private func setupUI() {
        navigationItem.leftBarButtonItem = addButton
        view.addSubview(collectionView)

    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.left.bottom.equalToSuperview()
        }
    }
    //MARK: - Compositional Layout create function
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

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layoutSection.boundarySupplementaryItems = [headerLayout]

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
                layoutSection.orthogonalScrollingBehavior = .groupPaging

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layoutSection.boundarySupplementaryItems = [headerLayout]

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

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layoutSection.boundarySupplementaryItems = [headerLayout]

                return layoutSection
            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1/2))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 4)

                let layouSection = NSCollectionLayoutSection(group: layoutGroup)
                layouSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                layouSection.orthogonalScrollingBehavior = .groupPaging

                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
                let headerLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                layouSection.boundarySupplementaryItems = [headerLayout]

                return layouSection
            default:
                return nil
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerTitle = AlbumsTitle.albumName[indexPath.section].title
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotosHeader.identifier, for: indexPath) as! PhotosHeader

        header.configure(text: headerTitle)
        return header

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return source[0].count
        case 1:
            return source[1].count
        case 2:
            return source[2].count
        case 3:
            return source[3].count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: Source
        switch indexPath.section {
        case 0:
            model = source[0][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? FlowLayoutCell
            cell?.configure(title: model.title, image: model.photo, count: model.count)
            return cell ?? UICollectionViewCell()
        case 1:
            model = source[1][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? FlowLayoutCell
            cell?.configure(title: model.title, image: model.photo, count: model.count)
            return cell ?? UICollectionViewCell()
        case 2:
            model = source[2][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? FlowLayoutCell
            cell?.configure(title: model.title, image: model.photo, count: model.count)
            return cell ?? UICollectionViewCell()
        case 3:
            model = source[3][indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionCell.identifier, for: indexPath) as? ListCollectionCell
            cell?.configure(image: model.photo, title: model.title, count: model.count)
            return cell ?? UICollectionViewCell()
        default:
            fatalError()
        }

    }
}
