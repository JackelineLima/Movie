//
//  Onboarding.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

public protocol UIOnboardingSliderDelegate: AnyObject {
    func didMove(to index: Int)
}

public class UIOnboardingSlider: UIView {
    
    weak var delegate: UIOnboardingSliderDelegate?
    private var views: [UIOnboardingImageSlider] = []
    var scrollView: UIScrollView = UIScrollView()
    private var stackView: UIStackView = UIStackView()
    private var pageControlView: UIPageControlMovie = UIPageControlMovie()
    
    public convenience init(views: [UIOnboardingImageSlider]) {
        self.init()
        
        configureView(views: views)
    }
    
    public func configureView(views: [UIOnboardingImageSlider]) {
        self.views = views
        setupView()
        clearStack()
        setupPageControl(with: views.count)
        pageControlView.isEnabled = false
        
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = true
        
        for view in views {
            let container = UIView()
            container.addSubview(view)

            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            view.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 24).isActive = true
            view.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -24).isActive = true
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true

            stackView.addArrangedSubview(container)

            container.translatesAutoresizingMaskIntoConstraints = false
            container.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        }
    }
    
    private func setupView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        pageControlView.translatesAutoresizingMaskIntoConstraints = false
        setuSubviews()
        setupConstraints()
    }

    private func setuSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        addSubview(pageControlView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            pageControlView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            pageControlView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControlView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControlView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pageControlView.heightAnchor.constraint(equalToConstant: 6)
            
        ])
    }
    
    func clearStack() {
        for view in stackView.arrangedSubviews {
            view.removeFromSuperview()
        }
    }
    
    private func setupPageControl(with size: Int) {
        pageControlView.setupLayout(numberOfPages: size)
    }
}

extension UIOnboardingSlider: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let _ = scrollView.contentOffset.x / scrollView.frame.size.width
        let width = UIScreen.main.bounds.width
        let page = Int(scrollView.contentOffset.x / width)
        pageControlView.setupCurrentPage(with: page)
        delegate?.didMove(to: page)
    }
}
