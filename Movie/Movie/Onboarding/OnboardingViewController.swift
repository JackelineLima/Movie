//
//  OnboardingViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol OnboardingDisplayable: AnyObject {
    func displaySomething()
}

final class OnboardingViewController: UIViewController {
    private lazy var contentView = OnboardingView()
    private let coordinator: OnboardingCoordinatable

    init(coordinator: OnboardingCoordinatable) {
      self.coordinator = coordinator
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.titleView = contentView.logoImageView
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "logo"), for: .default)
    }
}

extension OnboardingViewController: OnboardingDisplayable {
    func displaySomething() { }
}
