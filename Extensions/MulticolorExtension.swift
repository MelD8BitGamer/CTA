//
//  MulticolorExtension.swift
//  CTAEvents
//
//  Created by Melinda Diaz on 3/20/20.
//  Copyright © 2020 Melinda Diaz. All rights reserved.
//


import UIKit

struct FormattedString {
    static func turnMyTextIntoColorText(_ plainStr: String) -> NSAttributedString {
        
        let colors = [.systemRed, .systemBlue, #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), .systemPink, UIColor.cyan, .systemOrange, .systemYellow, .systemPurple]
        
        let mutableString: NSMutableAttributedString = NSMutableAttributedString(string: plainStr)
        
        for (index,_) in plainStr.enumerated(){
            let range = NSMakeRange(index, 1)
            let outdex: UIColor = colors[index % colors.count]
            mutableString.addAttribute(.foregroundColor, value: outdex, range: range)
        }
        return mutableString
    }
}
