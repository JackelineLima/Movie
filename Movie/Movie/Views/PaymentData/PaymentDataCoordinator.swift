//
//  PaymentDataCoordinator.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 08/09/22.
//

import UIKit

protocol PaymentDataCoordinatorProtocol: AnyObject {
    func start()
}

class PaymentDataCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension PaymentDataCoordinator: PaymentDataCoordinatorProtocol {
    
    func start() {
        let viewModel = PaymentDataViewModel(coordinator: self)
        let controller = PaymentDataViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}
