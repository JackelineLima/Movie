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
        UIFontStyle.customFont(name: .f18PrimaryBold)
    }
    
    public var height: CGFloat {
        switch self {
        case .buttonDefault, .buttonWithoutBackground:
            return 38.0
        }
    }
    
    public var backgroundColor: UIColor {
        switch self {
        case .buttonDefault:
            return .init(rgb: 0xD8D0B8)
        case .buttonWithoutBackground:
            return .init(rgb: 0x2D2D2D)
        }
    }
    
    public var textColor: UIColor {
        switch self {
        case .buttonDefault:
            return .init(rgb: 0x2D2D2D)
        case .buttonWithoutBackground:
            return .init(rgb: 0xCAB482)
        }
    }
    
    public var borderColor: UIColor {
        switch self {
        case .buttonDefault:
            return .init(rgb: 0x2D2D2D)
        case .buttonWithoutBackground:
            return .init(rgb: 0xD8D0B8)
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
        layer.borderWidth = 1
        layer.borderColor = style.borderColor.cgColor
        
        setSizeConstraints()
        
        if let imageName = imageName, let image = UIImage(named: imageName) {
            semanticContentAttribute = .forceRightToLeft
            setImage(image, for: .normal)
            imageView?.contentMode = .scaleAspectFit
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
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
                                                    constant: 180)
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
