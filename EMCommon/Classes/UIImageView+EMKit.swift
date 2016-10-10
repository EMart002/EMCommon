//
//  UIImageView.swift
//  common-extentions
//
//  Created by Martin Eberl on 02.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

public extension UIImageView {

    public func scaleToWidthConstraint(widthConstraint:CGFloat!) -> Double {
        guard widthConstraint > 0 else {
            return Double.infinity
        }
        guard self.image != nil else {
            return 0
        }
        
        let scale = widthConstraint / (self.image?.size.width)!
        self.width = widthConstraint
        self.height = scale * (self.image?.size.height)!
        
        return Double(scale)
    }
    
    public func scaleToHeightConstraint(heightConstraint:CGFloat!) -> Double {
        guard heightConstraint > 0 else {
            return Double.infinity
        }
        guard self.image != nil else {
            return 0
        }
        
        let scale = (self.image?.size.height)! / heightConstraint
        self.height = heightConstraint
        self.width = scale * (self.image?.size.width)!
        
        return scale as! Double
    }
}
