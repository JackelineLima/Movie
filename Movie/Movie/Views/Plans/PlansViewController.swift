//
//  PlansViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 31/08/22.
//

import UIKit

class PlansViewController: UIViewController {
    
    private lazy var plansView = PlansView()
    private let viewModel: PlansViewModelProtocol

    init(viewModel: PlansViewModelProtocol) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        plansView.delegate = self
        view = plansView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PlansViewController: PlansViewDelegate {
    
    func onTapButton() {
//        viewModel.navigateToPaymentData()
        let controller = WIAlertController.initialize(title: "Parabéns pela assinatura!", message: "Seja bem vindo (a), temos certeza que você irá adorar todo o conteúdo disponível.")
        present(controller, animated: true)
    }
}
