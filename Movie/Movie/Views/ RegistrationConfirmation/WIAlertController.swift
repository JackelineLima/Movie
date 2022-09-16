//
//  WIAlertController.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 14/09/22.
//

import UIKit

public class WIAlertController: UIViewController {
    
    private var alertTitle: String?
    private var message: String?
    private var imageString: String?
    private let mainAlertSubview: WIAlertView

    
    public init(title: String?, message: String?) {
        self.alertTitle = title
        self.message = message
        self.imageString = "alert"
        self.mainAlertSubview = WIAlertView()
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.66)
        setMainSubview()
    }
    
    private func setMainSubview() {
        view.addSubview(mainAlertSubview)
        mainAlertSubview.configure(title: alertTitle, message: message, image: imageString)
        setAlertConstraintForMainSubview()
    }
    
    private func setAlertConstraintForMainSubview() {
        mainAlertSubview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainAlertSubview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainAlertSubview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainAlertSubview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36.0),
            mainAlertSubview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36.0),
//            mainAlertSubview.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    public static func initialize(title: String, message: String) -> WIAlertController {
        let alertController = WIAlertController(title: title, message: message)
//        alertController.addButtons(buttons)
        return alertController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
