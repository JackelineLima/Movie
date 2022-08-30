//
//  LoginView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

final class LoginView: UIView, ViewCodable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = .init(rgb: 0xD8D0B8)
        buildViewHierarchy()
        setupConstraints()
    }

    func buildViewHierarchy() {}
    func setupConstraints() {}
}
