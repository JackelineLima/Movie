//
//  LoginCoordinator.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    func start()
    func navigateToPlans()
}

class LoginCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let controller = LoginViewController(viewModel: viewModel)
        navigationController.setViewControllers([controller], animated: true)
    }
    
    func navigateToPlans() {
        let coordinator = PlansCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
