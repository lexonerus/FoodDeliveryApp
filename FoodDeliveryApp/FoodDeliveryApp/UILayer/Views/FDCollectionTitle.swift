//
//  FDCollectionTitle.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 02.06.2024.
//

import UIKit

class FDCollectionTitle: UIView {
    
    let title = UILabel()
    let viewAll = UIButton()

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension FDCollectionTitle {
    func setupLayout() {
        configureView()
        configureTitle()
        configureViewAll()
    }

    func configureView() {
        self.backgroundColor = .clear
    }
    
    func configureTitle() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.text = "Title"
        
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            title.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func configureViewAll() {
        addSubview(viewAll)
        
        viewAll.translatesAutoresizingMaskIntoConstraints = false
        viewAll.setTitle("View All", for: .normal)
        viewAll.setTitleColor(.black, for: .normal)
        viewAll.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            viewAll.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            viewAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewAll.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
