//
//  UIStackView+Extensions.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 05/09/22.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
