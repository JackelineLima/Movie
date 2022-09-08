//
//  PlansCoordinator.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

protocol PlansCoordinatatorProtocol: AnyObject {
    func start()
    func navigateToPaymentData()
}

class PlansCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension PlansCoordinator: PlansCoordinatatorProtocol {
    
    func start() {
        let viewModel = PlansViewModel(coordinator: self)
        let controller = PlansViewController(viewModel: viewModel)
        navigationController.setViewControllers([controller], animated: true)
    }
    
    func navigateToPaymentData() {
        let coordinator = PaymentDataCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
