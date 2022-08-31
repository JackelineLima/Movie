//
//  LoginViewModel.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func navigateToPlans()
}

class LoginViewModel {
    
    private let coordinator: LoginCoordinatorProtocol
    
    init(coordinator: LoginCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    
    func navigateToPlans() {
        
    }
}
