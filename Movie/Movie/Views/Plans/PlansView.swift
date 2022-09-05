//
//  PlansView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

final class PlansView: UIView, ViewCodable {
    
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
        label.setupLabel(text: "Escolha seu plano", textColor: .init(rgb: 0x2D2D2D), font: UIFontStyle.customFont(name: .f20PrimaryBold))
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 48.0
        return stackView
    }()
    
    private lazy var iconCommitmentView: UICheckView = {
        let view = UICheckView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(text: "Sem compromisso, cancele quando quiser.")
        return view
    }()
    
    private lazy var iconContentView: UICheckView = {
        let view = UICheckView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(text: "Todo conteúdo por um preço único e acessível.")
        return view
    }()
    
    private lazy var iconWatchView: UICheckView = {
        let view = UICheckView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(text: "Assista o quanto quiser em todos os aparelhos.")
        return view
    }()
    
    private lazy var planButton: UIButtonMovie = {
        let button = UIButtonMovie()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setupLayout(style: .buttonWithoutBackground, title: "Próximo")
        return button
    }()
    
    private lazy var plansStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 21.0
        return stackView
    }()
    
    private lazy var selectPlanView: UIPlansView = {
        let view = UIPlansView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(text: "Básico")
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var selectPlanpPremiumView: UIPlansView = {
        let view = UIPlansView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(text: "Premium")
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var infoPlansStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 10.0
        return stackView
    }()
    
    private lazy var valuePlanView: UIInfoPlansView = {
        let view = UIInfoPlansView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(titleTop: "Preço por mês", textLeft: "R$24,30", textRight: "R$56,40")
        return view
    }()
    
    private lazy var adjectivesPlanView: UIInfoPlansView = {
        let view = UIInfoPlansView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(titleTop: "Video", textLeft: "Boa", textRight: "Superior")
        return view
    }()
    
    private lazy var resolutionsPlanView: UIInfoPlansView = {
        let view = UIInfoPlansView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setupLayout(titleTop: "Resolução", textLeft: "480p", textRight: "4K+")
        return view
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
        contentView.addSubViews([progressLabel, titleLabel, stackView])
        stackView.addArrangedSubviews([iconCommitmentView, iconContentView, iconWatchView])
        contentView.addSubview(plansStackView)
        plansStackView.addArrangedSubviews([selectPlanView, selectPlanpPremiumView])
        contentView.addSubview(infoPlansStackView)
        infoPlansStackView.addArrangedSubviews([valuePlanView, adjectivesPlanView, resolutionsPlanView])
        contentView.addSubview(planButton)
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

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            plansStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            plansStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            plansStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            plansStackView.heightAnchor.constraint(equalToConstant: 80),

            infoPlansStackView.topAnchor.constraint(equalTo: plansStackView.bottomAnchor, constant: 30),
            infoPlansStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            infoPlansStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),

            planButton.topAnchor.constraint(equalTo: infoPlansStackView.bottomAnchor, constant: 54),
            planButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            planButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -54)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .init(rgb: 0xD8D0B8)

        let progressLabelText = "PASSO 2 DE 3"
        progressLabel.setupAtributtedText(
            progressLabelText.formattText(
            text: progressLabelText,
            highlightedText: ["2","3"],
            fontName: UIFontStyle.customFont(name: .f14PrimaryRegular),
            customFontName: UIFontStyle.customFont(name: .f14PrimaryBold),
            highlightedColor: .init(rgb: 0x2D2D2D))
        )
    }
}
