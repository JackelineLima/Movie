//
//  PlansViewModel.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import Foundation

protocol PlansViewModelProtocol {
    func navigateToPaymentData()
}

class PlansViewModel {
    
    private let coordinator: PlansCoordinatatorProtocol

    init(coordinator: PlansCoordinatatorProtocol) {
      self.coordinator = coordinator
    }

}

extension PlansViewModel: PlansViewModelProtocol {
    
    func navigateToPaymentData() {
        coordinator.navigateToPaymentData()
    }
}
