//
//  UIFont+Extension.swift
//  FoodDeliveryApp
//
//  Created by Abylai Omar on 4/5/24.
//

import UIKit

extension UIFont {
    enum Roboto {
        enum black {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.black, size: size)  {
                    return font
                } else {
                    // Возвращаем стандартный шрифт, если запрашиваемый шрифт не найден
                    return UIFont.systemFont(ofSize: size)
                }

            }
        }
        
        enum blackItalic {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.blackItalic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        enum bold {
            static func size(of size: CGFloat) -> UIFont {
                if let font =  UIFont(name: Constants.Roboto.bold, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
            
            }
        }
        
        enum boldItalic {
            static func size(of size: CGFloat) -> UIFont {
                if let font =  UIFont(name: Constants.Roboto.boldItalic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        enum italic {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.italic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        enum light {
            static func size(of size: CGFloat) -> UIFont {
                if let font =  UIFont(name: Constants.Roboto.light, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        enum lightItalic {
            static func size(of size: CGFloat) -> UIFont {
                if let font =  UIFont(name: Constants.Roboto.lightItalic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
      
        enum medium {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.medium, size: size) {
                    return font
                } else {
                    // Возвращаем стандартный шрифт, если запрашиваемый шрифт не найден
                    return UIFont.systemFont(ofSize: size)
                }
            }
        }

        
        enum mediumItalic {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.mediumItalic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
            }
        }
        
        enum regular {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.regular, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        
        enum thin {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.thin, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
        
        
        enum thinItalic {
            static func size(of size: CGFloat) -> UIFont {
                if let font = UIFont(name: Constants.Roboto.thinItalic, size: size) {
                    return font
                } else {
                    return UIFont.systemFont(ofSize: size)
                }
                
            }
        }
    }
    
}

private extension UIFont {
    enum Constants {
        enum Roboto {
            static let black = "Roboto-Black"
            static let blackItalic = "Roboto-BlackItalic"
            static let bold = "Roboto-Bold"
            static let boldItalic = "Roboto-BoldItalic"
            static let italic = "Roboto-Italic"
            static let light = "Roboto-Light"
            static let lightItalic = "Roboto-LightItalic"
            static let medium = "Roboto-Medium"
            static let mediumItalic = "Roboto-MediumItalic"
            static let regular = "Roboto-Regular"
            static let thin = "Roboto-Thin"
            static let thinItalic = "Roboto-ThinItalic"
        }
    }
}
