//
//  LoginViewController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func displaySomething()
}

final class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView()
    private let coordinator: LoginCoordinatorProtocol

    init(coordinator: LoginCoordinatorProtocol) {
      self.coordinator = coordinator
      super.init(nibName: nil, bundle: .main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginViewController: LoginViewProtocol {
    func displaySomething() { }
}
