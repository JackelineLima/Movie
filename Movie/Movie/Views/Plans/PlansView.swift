//
//  PlansView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

final class PlansView: UIView, ViewCodable {
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .init(rgb: 0x2D2D2D)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha seu plano"
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f20PrimaryBold)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        addSubview(progressLabel)
        addSubview(titleLabel)
        addSubview(planButton)
        addSubview(stackView)
        stackView.addArrangedSubview(iconCommitmentView)
        stackView.addArrangedSubview(iconContentView)
        stackView.addArrangedSubview(iconWatchView)
        addSubview(plansStackView)
        plansStackView.addArrangedSubview(selectPlanView)
        plansStackView.addArrangedSubview(selectPlanpPremiumView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            progressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            titleLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            plansStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            plansStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            plansStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            plansStackView.heightAnchor.constraint(equalToConstant: 141),
            
            
            planButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            planButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .init(rgb: 0xD8D0B8)
        
        let progressLabelText = "PASSO 2 DE 3"
        progressLabel.attributedText = progressLabelText.formattText(
            text: progressLabelText,
            highlightedText: ["2","3"],
            fontName: UIFontStyle.customFont(name: .f14PrimaryRegular),
            customFontName: UIFontStyle.customFont(name: .f14PrimaryBold),
            highlightedColor: .init(rgb: 0x2D2D2D))
    }
}
