//
//  OnboardingView.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

final class OnboardingView: UIView {
    
    private var imagesArray: [OnboardingImageSlider] = []
    private var currentIndex = 0 {
        didSet {
            if currentIndex == imagesArray.count - 1 {
                onboardingButton.setupLayout(style: .buttonDefault, title: "Vamos começar!")
            }
        }
    }
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 200))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var onboardingView: OnboardingSlider = {
        let view = OnboardingSlider()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var onboardingButton: UIButtonMovie = {
        let button = UIButtonMovie()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setupLayout(style: .buttonDefault, title: "Próximo")
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
        addSubview(onboardingView)
        addSubview(onboardingButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            onboardingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            onboardingView.centerYAnchor.constraint(equalTo: centerYAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            onboardingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            onboardingButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    private func renderView() {
        imagesArray = renderImageSlider()
        onboardingView.configureView(views: imagesArray)
        setupActionButton(imagesArray.count)
    }
    
    private func renderImageSlider() -> [OnboardingImageSlider] {
        let images: [OnboardingImageSlider] = [
            OnboardingImageSlider(image: UIImage(named: "onboardingOne"), subtitle: "Filmes, séries e muito mais!"),
            OnboardingImageSlider(image:  UIImage(named: "onboardingTwo"), subtitle: "Assista em qualquer lugar."),
            OnboardingImageSlider(image:  UIImage(named: "onboardingThree"), subtitle: "Baixe e assista, com a família.")
        ]
        return images
    }
    
    private func setupActionButton(_ count: Int) {
        onboardingButton.setAction {
            if self.currentIndex < count - 1 {
                self.currentIndex += 1
                self.onboardingView.scrollView.setContentOffset(CGPoint(x: CGFloat(self.currentIndex) * self.frame.size.width, y: 0), animated: true)
            }
        }
    }
}

extension OnboardingView: OnboardingSliderDelegate {
    
    func didMove(to index: Int) {
        currentIndex = index
    }
    
    func onLastPage() {
        
    }
}
