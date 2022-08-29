//
//  OnboardingImageSlider.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

public class OnboardingImageSlider: UIView {
    
    var imageView: UIImageView = UIImageView()
    var subtitleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(image: UIImage?, subtitle: String) {
        self.init()
        setupView()
        backgroundColor = .clear
        
        if let img = image {
            imageView.image = img
            imageView.contentMode = .scaleAspectFit
        }
        
        subtitleLabel.text = subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .init(rgb: 0x2D2D2D)
        subtitleLabel.font = UIFontStyle.customFont(name: .f29PrimaryBold)
        subtitleLabel.numberOfLines = 0
    }
    
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        subviews.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 64),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
