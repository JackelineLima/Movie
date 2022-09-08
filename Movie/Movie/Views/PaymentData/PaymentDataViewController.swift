//
//  PaymentDataViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 08/09/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PaymentDataViewController: UIViewController {
    
    private lazy var paymentDataView = PaymentDataView()
    private let viewModel: PaymentDataViewModelProtocol

    init(viewModel: PaymentDataViewModelProtocol) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        paymentDataView.delegate = self
        view = paymentDataView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PaymentDataViewController: PaymentDataViewDelegate {
    
}
