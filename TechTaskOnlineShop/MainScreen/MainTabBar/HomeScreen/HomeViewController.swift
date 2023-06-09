//
//  HomeViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func showDetailsViewController()
}

final class HomeViewController: UIViewController {
    private var viewModel: HomeViewModelType
    weak var coordinator: HomeViewControllerDelegate?
    var resultsTableController: ResultsTableViewController? = nil
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.isUserInteractionEnabled = true
        collectionView.register(
            CategoryCell.self,
            forCellWithReuseIdentifier: CategoryCell.reuseIdentifier
        )
        collectionView.register(
            LatestCell.self,
            forCellWithReuseIdentifier: LatestCell.reuseIdentifier
        )
        collectionView.register(
            FlashSaleCell.self,
            forCellWithReuseIdentifier: FlashSaleCell.reuseIdentifier
        )
        collectionView.register(
            BrandCell.self,
            forCellWithReuseIdentifier: BrandCell.reuseIdentifier
        )
        collectionView.register(
            HeaderSupplementaryView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderSupplementaryView.reuseIdentifier
        )
        return collectionView
    }()
    
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setNavigationBar()
        setupSearchBar()
        setupHierarchy()
        setupLayout()
        getData()
        setDelegates()
        addObservers()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.backgroundColor
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func getData() {
        viewModel.getData {
            self.collectionView.reloadData()
        }
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(userImageChanged),
            name: NSNotification.Name(Constants.userImageChanged),
            object: nil
        )
    }
    
    private func setNavigationBar() {
        let menuImage = ImageConstants.menuImage
        let menuItem = UIBarButtonItem(
            image: menuImage,
            style: .plain,
            target: nil,
            action: nil
        )
        navigationItem.leftBarButtonItem = menuItem
        
        let firstTitleLabel = UILabel()
        firstTitleLabel.text = Constants.tradeByTitle
        firstTitleLabel.font = .montserratSemiBold24
        firstTitleLabel.textColor = .black
        let secondTitleLabel = UILabel()
        secondTitleLabel.text = Constants.bataTitle
        secondTitleLabel.font = .montserratSemiBold24
        secondTitleLabel.textColor = .customSystemColor
        let labelStack = UIStackView(
            arrangedSubviews: [firstTitleLabel, secondTitleLabel]
        )
        labelStack.alignment = .center
        labelStack.axis = .horizontal
        labelStack.spacing = 5
        navigationItem.titleView = labelStack
        
        let imageView = UIImageView()
        imageView.image = viewModel.getUserImage()
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.layer.cornerRadius = NumericalConstannts.defaultCornerRadius
        imageView.layer.masksToBounds = true
        let locationButton = UIButton(type: .system)
        locationButton.setTitle(Constants.locationTitle, for: .normal)
        locationButton.setImage(ImageConstants.chevronDownMiniImage, for: .normal)
        locationButton.tintColor = .darkGray
        locationButton.titleLabel?.font = .montserratRegular10
        locationButton.setTitleColor(.darkGray, for: .normal)
        locationButton.semanticContentAttribute = .forceRightToLeft
        let rightStack = UIStackView(
            arrangedSubviews: [imageView, locationButton]
        )
        rightStack.axis = .vertical
        rightStack.alignment = .center
        rightStack.spacing = 5
        let rightBarButtonItem = UIBarButtonItem(customView: rightStack)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func setupSearchBar() {
        self.resultsTableController = ResultsTableViewController(style: .plain)
        let searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.returnKeyType = .done
        searchController.searchBar.placeholder = Constants.searchBarPlaceholder
        searchController.searchBar.setCenteredPlaceHolder()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc private func userImageChanged() {
        setNavigationBar()
    }
}

//MARK: - Compositional Layout
extension HomeViewController {
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(55),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.1)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        group.interItemSpacing = .fixed(10)
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 0,
                                          supplementaryItems: [])
        section.contentInsets = .init(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        return section
    }
    
    private func createLatestSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .absolute(149)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 12,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(
            top: 0,
            leading: 11,
            bottom: 0,
            trailing: 11
        )
        return section
    }
    
    private func createFlashSaleSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.47),
            heightDimension: .absolute(221)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 9,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        return section
    }
    
    private func createBrandSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.3),
            heightDimension: .absolute(149)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 12,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(
            top: 0,
            leading: 11,
            bottom: 0,
            trailing: 11
        )
        return section
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .absolute(43)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {return nil}
            let sections = self.viewModel.sections
            let section = sections[sectionIndex]
            switch section {
                
            case .category(_):
                return self.createCategorySection()
            case .latest(_):
                return self.createLatestSection()
            case .flashSale(_):
                return self.createFlashSaleSection()
            case .brand(_):
                return self.createBrandSection()
            }
        }
    }
}

//MARK: - CollectionView Delegate, DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sections = viewModel.sections
        switch sections[indexPath.section] {
        case .category(let categories):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.reuseIdentifier,
                for: indexPath) as? CategoryCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: categories[indexPath.row])
            return cell
        case .latest(let latest):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LatestCell.reuseIdentifier,
                for: indexPath) as? LatestCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: latest[indexPath.row])
            return cell
        case .flashSale(let flashSales):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FlashSaleCell.reuseIdentifier,
                for: indexPath) as? FlashSaleCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: flashSales[indexPath.row])
            return cell
        case .brand(let brands):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BrandCell.reuseIdentifier,
                for: indexPath) as? BrandCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: brands[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderSupplementaryView.reuseIdentifier,
                for: indexPath) as? HeaderSupplementaryView
            else {
                return UICollectionReusableView()
            }
            
            let sections = viewModel.sections
            header.configure(sectionName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 1 {
            coordinator?.showDetailsViewController()
        }
    }
}

//MARK: - SearchController Delegate
extension HomeViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
        guard let searchText = navigationItem.searchController?.searchBar.text else {return}
        self.viewModel.getSearchWords(searchText: searchText) { [weak self] words in
            guard let self = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.resultsTableController?.items = words
                self.resultsTableController?.tableView.reloadData()
            }
        }
    }
    
}
