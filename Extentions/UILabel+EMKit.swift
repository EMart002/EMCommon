//
//  UILabel+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 02.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

extension UILabel {
    
    func optimizeForOneLine() {
        adjustSize(widthConstraint: CGFloat.max, heightConstraint: CGFloat.max)
    }
    
    func adjustHeight() {
        adjustHeight(widthConstraint: CGRectGetWidth(self.frame))
    }
    
    func adjustHeight(widthConstraint widthConstraint:CGFloat) {
        guard self.text != nil
            && self.font != nil else {
            
                self.numberOfLines = 0
                self.height = 0
                return
        }
        
        
        self.adjustHeight(widthConstraint: widthConstraint, heightConstraint: CGFloat.max)
    }
    
    func adjustHeight(widthConstraint widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSizeMake(widthConstraint, heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.height = self.text!.size(self.font!, contraintSize: constraintSize).height
    }
    
    func adjustWidth(widthConstraint widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSizeMake(widthConstraint, heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.width = self.text!.size(self.font!, contraintSize: constraintSize).width
    }
    
    func adjustSize(widthConstraint widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSizeMake(widthConstraint, heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.size = self.text!.size(self.font!, contraintSize: constraintSize)
    }
}
