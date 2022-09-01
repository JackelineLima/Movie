//
//  UIView+Extensions.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 01/09/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
