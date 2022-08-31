//
//  LoginView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func actionButton()
}

final class LoginView: UIView , ViewCodable {
    
    weak var delegate: LoginViewDelegate?
    
    private lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .init(rgb: 0x2D2D2D)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crie uma senha para iniciar "
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f20PrimaryBold)
        return label
    }()
    
    private lazy var personalDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dados Pessoais"
        label.textColor = .init(rgb: 0x2D2D2D)
        label.font = UIFontStyle.customFont(name: .f14PrimaryBold)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.keyboardType = .emailAddress
        txt.font = UIFontStyle.customFont(name: .f14PrimaryRegular)
        txt.textColor = UIColor.init(rgb: 0x2D2D2D)
        txt.attributedPlaceholder = setupTextLayoutTextField(text: "Email ou CPF", font: UIFontStyle.customFont(name: .f14PrimaryRegular), textColor: UIColor.init(rgb: 0x2D2D2D))
        txt.delegate = self
        return txt
    }()
    
    private lazy var borderEmailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0x2D2D2D)
        return view
    }()
    
    private lazy var borderPasswordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(rgb: 0x2D2D2D)
        return view
    }()
        
    private lazy var passwordTextField: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.keyboardType = .default
        txt.font = UIFontStyle.customFont(name: .f14PrimaryRegular)
        txt.attributedPlaceholder = setupTextLayoutTextField(text: "Senha", font: UIFontStyle.customFont(name: .f14PrimaryRegular), textColor: UIColor.init(rgb: 0x2D2D2D))
        txt.delegate = self
        return txt
    }()
    
    private lazy var loginButton: UIButtonMovie = {
        let button = UIButtonMovie()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setupLayout(style: .buttonWithoutBackground, title: "Próximo")
        return button
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
        addSubview(personalDataLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(borderEmailView)
        addSubview(borderPasswordView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            progressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            titleLabel.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            personalDataLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            personalDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            
            emailTextField.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 64),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            borderEmailView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            borderEmailView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            borderEmailView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            borderEmailView.heightAnchor.constraint(equalToConstant: 1),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 64),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            borderPasswordView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            borderPasswordView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            borderPasswordView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            borderPasswordView.heightAnchor.constraint(equalToConstant: 1),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .init(rgb: 0xD8D0B8)
        
        let progressLabelText = "PASSO 1 DE 3"
        progressLabel.attributedText = progressLabelText.formattText(
            text: progressLabelText,
            highlightedText: ["1","3"],
            fontName: UIFontStyle.customFont(name: .f14PrimaryRegular),
            customFontName: UIFontStyle.customFont(name: .f14PrimaryBold),
            highlightedColor: .init(rgb: 0x2D2D2D))
        
        loginButton.setAction {
            self.delegate?.actionButton()
        }
    }
    
    private func setupTextLayoutTextField(text: String, font: UIFont, textColor: UIColor) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: textColor,
        ]
        return NSAttributedString(string: text, attributes: attributes)
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
