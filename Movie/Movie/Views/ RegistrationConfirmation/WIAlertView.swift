//
//  WIAlertView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 14/09/22.
//

import UIKit

class WIAlertView: UIView {
    
    private var imageString: String?
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    
    let backgroundImageView = UIImageView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let button = UIButton()
    
    func configure(title: String?, message: String?, image: String?) {
        backgroundColor = .white
        self.alertTitle = title
        self.message = message
        self.imageString = image
        self.buttonTitle = ""
        setupUIComponents()
        layer.cornerRadius = 5.0
        clipsToBounds = true
    }
    
    private func setupUIComponents() {
        setupImageView()
        setupTitleLabel()
        setupMessageLabel()
        setupButtonStack()
    }
    
    private func setupImageView() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFit
        backgroundImageView.image = UIImage(named: "background")
        imageView.image = UIImage(named: imageString ?? "")
        addSubview(backgroundImageView)
        addSubview(imageView)
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor, constant: 42),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = alertTitle
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFontStyle.customFont(name: .f18PrimaryMedium)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupMessageLabel() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFontStyle.customFont(name: .f18PrimaryMedium)
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
    private func setupButtonStack() {
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        button.setTitle("Iniciar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFontStyle.customFont(name: .f20PrimaryBold)
        button.layer.cornerRadius = 25.0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.contentEdgeInsets = .init(top: 16, left: 0, bottom: 16, right: 0)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 42),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
        ])
    }
}
