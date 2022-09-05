//
//  UIPlansButton.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

class UIPlansView: UIControl, ViewCodable {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .init(rgb: 0x9E383C)
        label.font = UIFontStyle.customFont(name: .f18PrimaryBold)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .init(rgb: 0xCAB482)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupLayout(text: String) {
        titleLabel.text = text
    }
}
