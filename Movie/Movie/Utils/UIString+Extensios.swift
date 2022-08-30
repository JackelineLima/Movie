//
//  UIString+Extensios.swift
//  Movie
//
//  Created by Jackeline Pires De Lima on 30/08/22.
//

import UIKit


extension String {
    
    func formattText(text: String, highlightedText highlights: [String]?, fontName: UIFont, customFontName: UIFont, highlightedColor: UIColor) -> NSAttributedString {
        
        let textString = text as NSString
        let range = NSMakeRange(0, textString.length)
        
        let formattedText = NSMutableAttributedString(string: String(textString))
        formattedText.addAttribute(NSAttributedString.Key.font, value: fontName, range: range)
        formattedText.addAttribute(NSAttributedString.Key.foregroundColor, value: highlightedColor, range: range)
        
        if let highlights = highlights {
            for highlighted in highlights {
                let rangeHighlighted = textString.range(of: highlighted)
                formattedText.addAttribute(NSAttributedString.Key.foregroundColor, value: highlightedColor, range: rangeHighlighted)
                formattedText.addAttribute(NSAttributedString.Key.font, value: customFontName, range: rangeHighlighted)
            }
        }
        return formattedText
    }
}


