//
//  UICheckLabel.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

class UICheckView: UIView, ViewCodable {

    private lazy var icon = UIImageView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f18PrimaryRegular)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(icon)
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: topAnchor),
            icon.leadingAnchor.constraint(equalTo: leadingAnchor),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
        ])
    }
    
    func setupLayout(text: String, image: String? = "plans-icon") {
        titleLabel.text = text
        
        if let image = image {
            icon.image = UIImage(named: image)
        }
    }
}
