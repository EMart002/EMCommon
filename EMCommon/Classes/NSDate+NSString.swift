//
//  NSDate+NSString.swift
//  common-extentions
//
//  Created by Martin Eberl on 05.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

public extension Date {
    
    public func stringWithFormat(_ dateFormat:String!) -> String? {
        
        return self.stringWithFormat(dateFormat, timezone: nil)
    }
    
    public func stringWithFormat(_ dateFormat:String!, timezone:TimeZone?) -> String? {
    
        let df = DateFormatter()
        df.dateFormat = dateFormat
        
        if timezone != nil {
            df.timeZone = timezone
        }
        else {
            df.timeZone = TimeZone.current
        }
        
        return df.string(from: self)
    }
}
