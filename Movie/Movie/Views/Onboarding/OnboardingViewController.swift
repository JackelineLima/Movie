//
//  OnboardingViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var onboardingView = OnboardingView()
    private let coordinator: OnboardingCoordinatable

    init(coordinator: OnboardingCoordinatable) {
      self.coordinator = coordinator
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        onboardingView.delegate = self
        view = onboardingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.titleView = contentView.logoImageView
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "logo"), for: .default)
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func actionButton() {
        coordinator.navigateToLogin()
        print("Ir para login")
    }
}
