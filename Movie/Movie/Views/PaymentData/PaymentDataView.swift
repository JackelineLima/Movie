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
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.autoresizingMask = .flexibleHeight
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var progressLabel: UILabelMovie = {
        let label = UILabelMovie()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabelMovie = {
        let label = UILabelMovie()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupLabel(text: "Dados para o pagamento", textColor: .init(rgb: 0x2D2D2D), font: UIFontStyle.customFont(name: .f20PrimaryBold))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews([progressLabel, titleLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),

            titleLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .init(rgb: 0xD8D0B8)

        let progressLabelText = "PASSO 3 DE 3"
        progressLabel.setupAtributtedText(
            progressLabelText.formattText(
            text: progressLabelText,
            highlightedText: ["3","3"],
            fontName: UIFontStyle.customFont(name: .f14PrimaryRegular),
            customFontName: UIFontStyle.customFont(name: .f14PrimaryBold),
            highlightedColor: .init(rgb: 0x2D2D2D))
        )
    }
}
