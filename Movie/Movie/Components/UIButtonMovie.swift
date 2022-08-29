//
//  UIButtonMovie.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import Foundation
import UIKit

public enum UIButtonStyle {
    case buttonDefault
    case buttonWithoutBackground
    
    public var font: UIFont {
        UIFontStyle.customFont(name: .f18PrimaryMedium)
    }
    
    public var height: CGFloat {
        switch self {
        case .buttonDefault:
            return 47.0
        case .buttonWithoutBackground:
            return 24.0
        }
    }
    
    public var backgroundColor: UIColor {
        switch self {
        case .buttonDefault:
            return .init(rgb: 0xEFA85C)
        case .buttonWithoutBackground:
            return .white
        }
    }
    
    public var textColor: UIColor {
        switch self {
        case .buttonDefault:
            return .white
        case .buttonWithoutBackground:
            return .init(rgb: 0xEFA85C)
        }
    }
    
    public var cornerRadius: CGFloat {
        return 5
    }
}

public class UIButtonMovie: UIButton {
    
    private var buttonStyle: UIButtonStyle = .buttonDefault
    public var heightConstraint: NSLayoutConstraint!
    private var buttonAction: (() -> Void)?
    
    public convenience init(_ style: UIButtonStyle = .buttonDefault, title: String = "", imageName: String? = nil) {
        self.init()
        
        setupLayout(style: style, title: title, imageName: imageName)
    }
    
    public func setupLayout(style: UIButtonStyle = .buttonDefault, title: String, imageName: String? = nil) {
        buttonStyle = style
        setTitle(title, for: .normal)
        backgroundColor = buttonStyle.backgroundColor
        setTitleColor(buttonStyle.textColor, for: .normal)
        layer.cornerRadius = style.cornerRadius
        
        setSizeConstraints()
        
        if let imageName = imageName, let image = UIImage(named: imageName) {
            self.setImage(image, for: .normal)
            self.imageView?.contentMode = .scaleAspectFit
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        }
        
        guard let titleLabel = titleLabel else { return }
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = style.font
    }
    
    public func setSizeConstraints() {
        let minWidthConstraint = NSLayoutConstraint(item: self,
                                                    attribute: .width,
                                                    relatedBy: .greaterThanOrEqual,
                                                    toItem: nil,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 1,
                                                    constant: 140)
        heightConstraint = NSLayoutConstraint(item: self,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: nil,
                                              attribute: .notAnAttribute,
                                              multiplier: 1,
                                              constant: buttonStyle.height)
        NSLayoutConstraint.activate([minWidthConstraint, heightConstraint])
    }
    
    public func setAction(_ action: (() -> Void)?) {
        buttonAction = action
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        buttonAction?()
    }
    
    public func removeSizeConstraints() {
        removeConstraint(heightConstraint)
    }
}
