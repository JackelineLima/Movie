//
//  LoginCoordinator.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    func start()
}

class LoginCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    
    func start() {
        let controller = LoginViewController(coordinator: self)
        navigationController.setViewControllers([controller], animated: true)
    }
}
