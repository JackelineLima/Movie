//
//  OnboardingViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var onboardingView = OnboardingView()
    private let viewModel: OnboardingViewModelProtocol

    init(viewModel: OnboardingViewModelProtocol) {
      self.viewModel = viewModel
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
    }
}

extension OnboardingViewController: OnboardingViewDelegate {
    func actionButton() {
        viewModel.navigateToLogin()
    }
}
