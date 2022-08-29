//
//  PageControl.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 29/08/22.
//

import Foundation
import UIKit

class PageControl: UIPageControl {
    
    public convenience init(numberOfPages: Int) {
        self.init()
        
        setupLayout(numberOfPages: numberOfPages)
    }
    
    public func setupLayout(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        backgroundColor = .clear
        pageIndicatorTintColor = .white
        currentPageIndicatorTintColor = .init(rgb: 0x2D2D2D)
        contentMode = .redraw
    }
    
    public func setupCurrentPage(with index: Int) {
        currentPage = index
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect:rect, cornerRadius: 10)
        let color = UIColor.red
        color.setFill()
        path.fill()
//        print(rect)
    }
}
