//
//  UIInfoPlansView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

class UIInfoPlansView: UIView, ViewCodable {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f14PrimaryRegular)
        return label
    }()
    
    private lazy var titleLeftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f18PrimaryMedium)
        return label
    }()
    
    private lazy var titleRightLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 56,40"
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f18PrimaryMedium)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(rgb: 0x2D2D2D)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(titleLeftLabel)
        addSubview(titleRightLabel)
        addSubview(lineView)
    }
    
    func setupConstraints() {
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLeftLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            titleLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            titleRightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            titleRightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            lineView.topAnchor.constraint(equalTo: titleRightLabel.bottomAnchor, constant: 8),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupLayout(titleTop: String, textLeft: String, textRight: String) {
        titleLabel.text = titleTop
        titleLeftLabel.text = textLeft
        titleRightLabel.text = textRight
    }
}
