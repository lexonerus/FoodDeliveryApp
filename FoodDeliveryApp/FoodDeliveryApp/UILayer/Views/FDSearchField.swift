//
//  FDSearchField.swift
//  FoodDeliveryApp
//
//  Created by Alexey Krzywicki on 02.06.2024.
//

import UIKit

class FDSearchField: UITextField {

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.layer.cornerRadius = 24
        self.backgroundColor = AppColors.grey
        self.font = UIFont.Roboto.regular.size(of: 16)
        self.attributedPlaceholder = NSAttributedString(string:"Search", attributes: [NSAttributedString.Key.foregroundColor: AppColors.black.withAlphaComponent(0.5)])
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 2, width: 20, height: 20))
        imageView.image = UIImage(resource: .loupe)
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20 + 20 + 10, height: 22))
        leftPaddingView.addSubview(imageView)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
        
        self.leftView = leftPaddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }

}
