//
//  OnboardingCoordinator.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import UIKit

protocol OnboardingCoordinatable: AnyObject {
    func start()
    func navigateToLogin()
}

final class OnboardingCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension OnboardingCoordinator: OnboardingCoordinatable {
    
    func start() {
        let controller = OnboardingViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: true)
    }
    
    func navigateToLogin() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
