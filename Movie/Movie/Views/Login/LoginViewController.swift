//
//  LoginViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private let viewModel: LoginViewModelProtocol

    init(viewModel: LoginViewModelProtocol) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        loginView.delegate = self
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension LoginViewController: LoginViewDelegate {
    func actionButton() {
        viewModel.navigateToPlans()
    }
}
