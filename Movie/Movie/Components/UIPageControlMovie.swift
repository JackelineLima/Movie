//
//  PageControl.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 29/08/22.
//

import Foundation
import UIKit

class UIPageControlMovie: UIPageControl {

    override var currentPage: Int {
        didSet {
            setupIndicator()
        }
    }

    override var numberOfPages: Int {
        didSet {
            setupIndicator()
        }
    }
    
    public convenience init(numberOfPages: Int) {
        self.init()
        
        setupLayout(numberOfPages: numberOfPages)
    }
    
    public func setupLayout(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        backgroundColor = .clear
        contentMode = .redraw
        currentPageIndicatorTintColor = .init(rgb: 0x2D2D2D)
        pageIndicatorTintColor = .init(rgb: 0x2D2D2D)
    }
    
    public func setupCurrentPage(with index: Int) {
        currentPage = index
    }
    
    private func setupIndicator() {
        for index in 0..<numberOfPages {
            if index == currentPage {
                setIndicatorImage(UIImage(named: "elipse-background"), forPage: index)
            } else {
                setIndicatorImage(UIImage(named: "elipse-onboarding"), forPage: index)
            }
        }
    }
}
