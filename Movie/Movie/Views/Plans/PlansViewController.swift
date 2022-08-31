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
        view = plansView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}