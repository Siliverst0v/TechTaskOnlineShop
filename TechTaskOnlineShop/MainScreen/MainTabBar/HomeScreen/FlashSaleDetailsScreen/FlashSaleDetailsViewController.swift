//
//  FlashSaleDetailsViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

final class FlashSaleDetailsViewController: UIViewController {
    
    var viewModel: FlashSaleDetailsViewModelType
    private var isAddedToCart = false
    private var inCartCount = 0
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        collectionView.isUserInteractionEnabled = true
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(
            DetailsSmallCell.self,
            forCellWithReuseIdentifier: DetailsSmallCell.reuseIdentifier
        )
        collectionView.register(
            DetailsLargeCell.self,
            forCellWithReuseIdentifier: DetailsLargeCell.reuseIdentifier
        )
        return collectionView
    }()
    
    private let favouriteShareView: FavouriteShareView = {
        let view = FavouriteShareView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addToCartView: AddToCartView = {
        let view = AddToCartView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold17
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold14
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    
    private let namePriceStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratRegular10
        label.textAlignment = .left
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = ImageConstants.ratingStarImage
        imageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return imageView
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .montserratSemiBold10
        return label
    }()
    
    private let reviewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .montserratRegular8
        return label
    }()
    
    private let rateStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratSemiBold10
        label.textColor = .darkGray
        label.text = Constants.colorsTitle
        return label
    }()
    
    private let firstColorLabel: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    private let secondColorLabel: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    private let thirdColorLabel: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    private let colorsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 14
        return stack
    }()
    
    init(viewModel: FlashSaleDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        addTargets()
        getData()
        setDelegates()
    }
    
    private func setupView() {
        view.backgroundColor = .backgroundColor
    }
    
    private func setupHierarchy() {
        rateStack.addArrangedSubview(starImage)
        rateStack.addArrangedSubview(rateLabel)
        rateStack.addArrangedSubview(reviewsLabel)
        colorsStack.addArrangedSubview(firstColorLabel)
        colorsStack.addArrangedSubview(secondColorLabel)
        colorsStack.addArrangedSubview(thirdColorLabel)
        namePriceStack.addArrangedSubview(nameLabel)
        namePriceStack.addArrangedSubview(priceLabel)
        view.addSubviews([collectionView,
                          addToCartView,
                          rateStack,
                          colorsStack,
                          colorLabel,
                          descriptionLabel,
                          namePriceStack])
        view.insertSubview(favouriteShareView, aboveSubview: collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 426),
            
            favouriteShareView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 156),
            favouriteShareView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            favouriteShareView.widthAnchor.constraint(equalToConstant: 42),
            
            addToCartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addToCartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addToCartView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addToCartView.heightAnchor.constraint(equalToConstant: 172),
            
            colorsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            colorsStack.bottomAnchor.constraint(equalTo: addToCartView.topAnchor, constant: -21),
            colorsStack.heightAnchor.constraint(equalToConstant: 26),
            colorsStack.widthAnchor.constraint(equalToConstant: 129),
            
            colorLabel.leadingAnchor.constraint(equalTo: colorsStack.leadingAnchor),
            colorLabel.bottomAnchor.constraint(equalTo: colorsStack.topAnchor, constant: -11),
            colorLabel.trailingAnchor.constraint(equalTo: colorsStack.trailingAnchor),
            
            rateStack.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            rateStack.bottomAnchor.constraint(equalTo: colorLabel.topAnchor, constant: -17),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: rateStack.leadingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: rateStack.topAnchor, constant: -14),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 194),
            
            namePriceStack.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            namePriceStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23),
            namePriceStack.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0)
            
        ])
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func addTargets() {
        firstColorLabel.addTarget(
            self,
            action: #selector(chooseColor(_:)),
            for: .touchUpInside
        )
        secondColorLabel.addTarget(
            self,
            action: #selector(chooseColor(_:)),
            for: .touchUpInside
        )
        thirdColorLabel.addTarget(
            self,
            action: #selector(chooseColor(_:)),
            for: .touchUpInside
        )
        addToCartView.addToCartButton.addTarget(
            self,
            action: #selector(addToCart),
            for: .touchUpInside
        )
        addToCartView.minusButton.addTarget(
            self,
            action: #selector(minusPrice),
            for: .touchUpInside
        )
        addToCartView.plusButton.addTarget(
            self,
            action: #selector(plusPrice),
            for: .touchUpInside
        )
    }
    
    private func getData() {
        viewModel.getData { [weak self] productDetails in
            guard let self = self else {return}
            self.collectionView.reloadData()
            self.nameLabel.text = productDetails.name
            self.descriptionLabel.text = productDetails.description
            self.rateLabel.text = String(productDetails.rating)
            self.reviewsLabel.text = "(\(productDetails.numberOfReviews) reviews)"
            self.priceLabel.text = "$ \(productDetails.price)"
            self.firstColorLabel.backgroundColor = UIColor(hex: productDetails.colors[0])
            self.secondColorLabel.backgroundColor = UIColor(hex: productDetails.colors[1])
            self.thirdColorLabel.backgroundColor = UIColor(hex: productDetails.colors[2])
            self.addToCartView.addToCartButton.sumLabel.text = "$ \(productDetails.price)"
            self.viewModel.price = productDetails.price
        }
    }
    
    @objc private func chooseColor(_ sender: UIButton) {
        firstColorLabel.layer.borderWidth = 0
        secondColorLabel.layer.borderWidth = 0
        thirdColorLabel.layer.borderWidth = 0
        sender.layer.borderWidth = 3
        sender.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc private func addToCart() {
        isAddedToCart.toggle()
        if isAddedToCart {
            self.inCartCount += 1
            addToCartView.addToCartButton.sumLabel.textColor = .white
            addToCartView.addToCartButton.addLabel.text = Constants.inCartTitle
        } else {
            self.inCartCount = 0
            addToCartView.addToCartButton.sumLabel.textColor = .addToCartSumLabelTextColor
            addToCartView.addToCartButton.addLabel.text = Constants.addToCartTitle
        }
    }
    
    @objc private func minusPrice() {
        guard let price = viewModel.price else {return}
        if inCartCount >= 2 {
            inCartCount -= 1
            addToCartView.addToCartButton.sumLabel.text = "$ \(price * inCartCount)"
        }
    }
    
    @objc private func plusPrice() {
        guard let price = viewModel.price else {return}
        inCartCount += 1
        addToCartView.addToCartButton.sumLabel.text = "$ \(price * inCartCount)"
    }
}

//MARK: - Compositional Layout
extension FlashSaleDetailsViewController {
    
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
    
    private func createLargeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.85),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(279)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = createLayoutSection(group: group,
                                          behavior: .paging,
                                          interGroupSpacing: 0,
                                          supplementaryItems: [])
        return section
    }
    
    private func createSmallSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(NumericalConstannts.smallCellWidth),
            heightDimension: .absolute(40)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        group.interItemSpacing = .fixed(NumericalConstannts.smallSectionSpacing)
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0,
                                          supplementaryItems: [])
        let totalCellWidth = NumericalConstannts.smallCellWidth * 3
        let totalSpacing = NumericalConstannts.smallSectionSpacing * 2
        let inset = (self.collectionView.frame.size.width - (totalCellWidth + totalSpacing))/2
        section.contentInsets = .init(
            top: 42,
            leading: inset,
            bottom: 0,
            trailing: inset
        )
        return section
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {return nil}
            let sections = self.viewModel.sections
            let section = sections[sectionIndex]
            switch section {
            case .largeImages(_):
                return self.createLargeSection()
            case .smallImages(_):
                return self.createSmallSection()
            }
        }
    }
}

extension FlashSaleDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfItemsInSection(section: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getNumberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sections = viewModel.sections
        switch sections[indexPath.section] {
            
        case .largeImages(let images):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DetailsLargeCell.reuseIdentifier,
                for: indexPath) as? DetailsLargeCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: images[indexPath.row])
            return cell
        case .smallImages(let images):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DetailsSmallCell.reuseIdentifier,
                for: indexPath) as? DetailsSmallCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: images[indexPath.row])
            if indexPath.row == 0 {
                self.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            collectionView.scrollToItem(
                at: IndexPath(row: indexPath.row, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
        }
    }
}
