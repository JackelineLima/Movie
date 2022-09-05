//
//  OnboardingView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func actionButton()
}

final class OnboardingView: UIView {
    
    weak var delegate: OnboardingViewDelegate?
    private var imagesArray: [UIOnboardingImageSlider] = []
    private var currentIndex = 0 {
        didSet {
            setupDescriptionbutton()
        }
    }
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 200))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var onboardingView: UIOnboardingSlider = {
        let view = UIOnboardingSlider()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var onboardingButton: UIButtonMovie = {
        let button = UIButtonMovie()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setupLayout(style: .buttonDefault, title: "Próximo", imageName: "icon-button")
        return button
    }()
    
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
        renderView()
    }

    private func buildViewHierarchy() {
        addSubViews([logoImageView, onboardingView, onboardingButton])    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            onboardingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            onboardingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            onboardingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            onboardingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    private func renderView() {
        imagesArray = renderImageSlider()
        onboardingView.configureView(views: imagesArray)
        setupActionButton(imagesArray.count)
    }
    
    private func renderImageSlider() -> [UIOnboardingImageSlider] {
        let images: [UIOnboardingImageSlider] = [
            UIOnboardingImageSlider(image: UIImage(named: "onboardingOne"), subtitle: "Filmes, séries e muito mais!"),
            UIOnboardingImageSlider(image:  UIImage(named: "onboardingTwo"), subtitle: "Assista em qualquer lugar."),
            UIOnboardingImageSlider(image:  UIImage(named: "onboardingThree"), subtitle: "Baixe e assista, com a família.")
        ]
        return images
    }
    
    private func setupActionButton(_ count: Int) {
        onboardingButton.setAction {
            if self.currentIndex < count - 1 {
                self.currentIndex += 1
                self.onboardingView.scrollView.setContentOffset(CGPoint(x: CGFloat(self.currentIndex) * self.frame.size.width, y: 0), animated: true)
            } else {
                self.delegate?.actionButton()
            }
        }
    }
    
    private func setupDescriptionbutton() {
        if currentIndex == imagesArray.count - 1 {
            onboardingButton.setupLayout(style: .buttonWithoutBackground, title: "Vamos começar!")
        } else {
            onboardingButton.setupLayout(style: .buttonDefault, title: "Próximo")
        }
    }
}

extension OnboardingView: UIOnboardingSliderDelegate {
    
    func didMove(to index: Int) {
        currentIndex = index
    }
}
