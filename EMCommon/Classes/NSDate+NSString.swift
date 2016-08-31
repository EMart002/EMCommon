//
//  NSDate+NSString.swift
//  common-extentions
//
//  Created by Martin Eberl on 05.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

public extension NSDate {
    
    public func stringWithFormat(dateFormat:String!) -> String? {
        
        return self.stringWithFormat(dateFormat, timezone: nil)
    }
    
    public func stringWithFormat(dateFormat:String!, timezone:NSTimeZone?) -> String? {
    
        let df = NSDateFormatter()
        df.dateFormat = dateFormat
        
        if timezone != nil {
            df.timeZone = timezone
        }
        else {
            df.timeZone = NSTimeZone.defaultTimeZone()
        }
        
        return df.stringFromDate(self)
    }
}
