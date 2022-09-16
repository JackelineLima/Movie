//
//  UIButton.Configuration.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 16/09/22.
//

import UIKit

@available(iOS 15.0, *)
extension UIButton.Configuration {
    
    public static func setButtonConfiguration(backgroundColor: UIColor, title: String, icon: UIImage? = nil, font: UIFontStyle, textColor: UIColor) -> UIButton.Configuration {
        
        let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFontStyle.customFont(name: font),
                    .foregroundColor: textColor,
                ]
        
        var configuration = UIButton.Configuration.filled()
        configuration.attributedTitle = AttributedString(title, attributes: .init(attributes))
        configuration.image = icon
        configuration.titlePadding = 10
        configuration.imagePadding = 30
        configuration.background.backgroundColor = backgroundColor
        return configuration
    }
}
