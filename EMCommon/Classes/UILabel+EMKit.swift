//
//  UILabel+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 02.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

public extension UILabel {
    
    public func optimizeForOneLine() {
        adjustSize(CGFloat.max, heightConstraint: CGFloat.max)
    }
    
    public func adjustHeight() {
        adjustHeight(self.frame.width)
    }
    
    public func adjustHeight(widthConstraint:CGFloat) {
        guard self.text != nil
            && self.font != nil else {
            
                self.numberOfLines = 0
                self.height = 0
                return
        }
        
        
        self.adjustHeight(widthConstraint, heightConstraint: CGFloat.max)
    }
    
    public func adjustHeight(widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSize(width: widthConstraint, height: heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.height = self.text!.size(self.font!, contraintSize: constraintSize).height
    }
    
    public func adjustWidth(widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSize(width: widthConstraint, height: heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.width = self.text!.size(self.font!, contraintSize: constraintSize).width
    }
    
    public func adjustSize(widthConstraint:CGFloat, heightConstraint:CGFloat) {
        let constraintSize = CGSize(width: widthConstraint, height: heightConstraint)
        
        self.numberOfLines = self.text!.numberOfLines(self.font!, contraintSize: constraintSize)
        self.size = self.text!.size(self.font!, contraintSize: constraintSize)
    }
}
