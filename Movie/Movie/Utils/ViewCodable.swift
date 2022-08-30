//
//  ViewCodable.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import Foundation

public protocol ViewCodable: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

public extension ViewCodable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
