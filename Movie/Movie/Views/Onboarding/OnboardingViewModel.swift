//
//  OnboardingViewModel.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 28/08/22.
//

import Foundation

protocol OnboardingViewModelProtocol: AnyObject {
   func navigateToLogin()
}

class OnboardingViewModel {

    let coodinator: OnboardingCoordinatorProtocol
    
    init(coodinator: OnboardingCoordinatorProtocol) {
        self.coodinator = coodinator
    }
}

extension OnboardingViewModel: OnboardingViewModelProtocol {
    
    func navigateToLogin() {
        coodinator.navigateToLogin()
    }
}
