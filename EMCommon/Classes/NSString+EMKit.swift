//
//  UIView+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 14.06.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

public extension NSString {
    
    public func size(font: UIFont!, contraintSize:CGSize!) -> CGSize {
    
        if self.respondsToSelector(#selector(self.boundingRectWithSize(_:options:attributes:context:))) {
            
            return self.boundingRectWithSize(contraintSize,
                                             options:NSStringDrawingOptions.UsesLineFragmentOrigin,
                                             attributes: [NSFontAttributeName:font],
                                             context: nil).size
        }
        
        return CGSize.zero;
    }
    
    public func numberOfLines(_ font: UIFont!, contraintSize:CGSize!) -> Int {
        
        let aSize:CGSize = NSString(string: "A").size(font, contraintSize:CGSize(width: CGFloat.max, height: CGFloat.max))
        let textSize:CGSize = self.size(font, contraintSize:contraintSize)
    
        let d = textSize.height / aSize.height
        let i = ceil(d)
        
        
        return Int(i)
    }
}
