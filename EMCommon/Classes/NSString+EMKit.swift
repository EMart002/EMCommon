//
//  UIView+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 14.06.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

public extension NSString {
    
    public func size(_ font: UIFont!, contraintSize:CGSize!) -> CGSize {
    
        if self.responds(to: #selector(NSString.boundingRect(with:options:attributes:context:))) {
            
            return self.boundingRect(with: contraintSize,
                                             options:NSStringDrawingOptions.usesLineFragmentOrigin,
                                             attributes: [NSFontAttributeName:font],
                                             context: nil).size
        }
        
        return CGSize.zero;
    }
    
    public func numberOfLines(_ font: UIFont!, contraintSize:CGSize!) -> Int {
        
        let aSize:CGSize = NSString(string: "A").size(font, contraintSize:CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        let textSize:CGSize = self.size(font, contraintSize:contraintSize)
    
        let d = textSize.height / aSize.height
        let i = ceil(d)
        
        
        return Int(i)
    }
}
