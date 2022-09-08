//
//  PaymentDataView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 08/09/22.
//

import UIKit

protocol PaymentDataViewDelegate: AnyObject {
    
}

final class PaymentDataView: UIView, ViewCodable {
    
    weak var delegate: PaymentDataViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {}
    func setupConstraints() {}
}
