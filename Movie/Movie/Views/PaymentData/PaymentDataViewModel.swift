//
//  PaymentDataViewModel.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 08/09/22.
//

import Foundation

protocol PaymentDataViewModelProtocol {
    
}

class PaymentDataViewModel: PaymentDataViewModelProtocol {
    
    private let coordinator: PaymentDataCoordinatorProtocol

    init(coordinator: PaymentDataCoordinatorProtocol) {
      self.coordinator = coordinator
    }
}
