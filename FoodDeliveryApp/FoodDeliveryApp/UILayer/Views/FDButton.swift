//
//  FDButton.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 05.03.2024.
//

import UIKit

enum FDButtonColorSchemes {
    case white
    case orange
    case grey
}

class FDButton: UIView {
    
    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: FDButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }

    init(scheme: FDButtonColorSchemes = .white) {
        super.init(frame: .zero)
        self.scheme = scheme
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupButton()
    }

    private func setupButton() {
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.layer.cornerRadius = 24
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    @objc private func buttonPressed() {
        guard let action = self.action else { return }
        action()
    }
    
    private func setColorScheme(scheme: FDButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.accentOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.accentOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .grey:
            button.backgroundColor = AppColors.grey
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}
