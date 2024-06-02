//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 07.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let searchField = FDSearchField()
    private let geoMarkImage = UIImageView()
    private let geoLabel = UILabel()
    private let bigHCollectionTitle = FDCollectionTitle()
    private let bigVCollectionTitle = FDCollectionTitle()
    lazy var smallHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 40
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 1
        return collection
    }()
    lazy var bigHCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = .zero
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.tag = 2
        return collection
    }()
    lazy var bigVCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.headerReferenceSize = .zero
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.tag = 3
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

}

// MARK: - Layout
extension HomeViewController {
    func setupLayout() {
        setupView()
        configureScrollView()
        configureContentView()
        prepareScrollView()
        configureSearchField()
        configureGeoMark()
        configureGeoLabel()
        setupSmallHCollection()
        configureBigHCollectionTitle()
        setupBigHCollection()
        configureBigVCollectionTitle()
        setupBigVCollection()
        // TODO: - Only for mock data
        calculateContentSize()
    }
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .clear
    }
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .clear
    }
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    func configureSearchField() {
        contentView.addSubview(searchField)
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            searchField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func configureGeoMark() {
        contentView.addSubview(geoMarkImage)
        
        geoMarkImage.image = UIImage(resource: .geoMark)
        geoMarkImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            geoMarkImage.heightAnchor.constraint(equalToConstant: 20),
            geoMarkImage.widthAnchor.constraint(equalToConstant: 14),
            geoMarkImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
            geoMarkImage.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10)
        ])
    }
    func configureGeoLabel() {
        contentView.addSubview(geoLabel)
        
        geoLabel.text = "9 West 46 Th Street, New York City"
        geoLabel.translatesAutoresizingMaskIntoConstraints = false
        geoLabel.numberOfLines = 0
        geoLabel.font = .Roboto.regular.size(of: 12)
        geoLabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            geoLabel.centerYAnchor.constraint(equalTo: geoMarkImage.centerYAnchor, constant: 0),
            geoLabel.leftAnchor.constraint(equalTo: geoMarkImage.rightAnchor, constant: 10),
            geoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
            geoLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    func setupSmallHCollection() {
        contentView.addSubview(smallHCollection)
        
        smallHCollection.backgroundColor = .red
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: geoMarkImage.bottomAnchor, constant: 30),
            smallHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            smallHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            smallHCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    func configureBigHCollectionTitle() {
        contentView.addSubview(bigHCollectionTitle)
        bigHCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigHCollectionTitle.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 30),
            bigHCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigHCollectionTitle.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    func setupBigHCollection() {
        contentView.addSubview(bigHCollection)
        
        bigHCollection.backgroundColor = .red
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHCViewCell.self, forCellWithReuseIdentifier: "BigHCViewCell")
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: bigHCollectionTitle.bottomAnchor, constant: 26),
            bigHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bigHCollection.heightAnchor.constraint(equalToConstant: 130*2+20)
        ])
    }
    func configureBigVCollectionTitle() {
        contentView.addSubview(bigVCollectionTitle)
        bigVCollectionTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bigVCollectionTitle.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 20),
            bigVCollectionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollectionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollectionTitle.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    func setupBigVCollection() {
        contentView.addSubview(bigVCollection)
        
        bigVCollection.backgroundColor = .red
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigHCViewCell.self, forCellWithReuseIdentifier: "BigHCViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigVCollectionTitle.bottomAnchor, constant: 26),
            bigVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollection.heightAnchor.constraint(equalToConstant: 1000),
            bigVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func calculateContentSize() {
        var totalHeight: CGFloat = 300 + 50 + 50 + 22 + 22 + 30 + 30 + 30 + 30 + smallHCollection.bounds.height + bigHCollection.bounds.height
        
        for index in 0..<bigVCollection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: index, section: 0)
            let cellHeight = collectionView(bigVCollection, layout: bigVCollection.collectionViewLayout, sizeForItemAt: indexPath).height
            totalHeight += cellHeight
        }
        
        let spacing = CGFloat(bigVCollection.numberOfItems(inSection: 0) - 1) * 30
        
        contentView.heightAnchor.constraint(equalToConstant: totalHeight + spacing).isActive = true
    }
}

// MARK: - CollectionView delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return 30
        case 2:
            return 15
        case 3:
            return 20
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCViewCell", for: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCViewCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            let height = 130.0
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
