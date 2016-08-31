//
//  NSDate.swift
//  common-extentions
//
//  Created by Martin Eberl on 07.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

public func < (first: NSDate, second: NSDate) -> Bool {
    return first.compare(second) == .OrderedAscending
}

public func > (first: NSDate, second: NSDate) -> Bool {
    return first.compare(second) == .OrderedDescending
}

public func <= (first: NSDate, second: NSDate) -> Bool {
    let cmp = first.compare(second)
    return cmp == .OrderedAscending || cmp == .OrderedSame
}

public func >= (first: NSDate, second: NSDate) -> Bool {
    let cmp = first.compare(second)
    return cmp == .OrderedDescending || cmp == .OrderedSame
}

public func == (first: NSDate, second: NSDate) -> Bool {
    return first.compare(second) == .OrderedSame
}

public extension NSDate {

    public var year:Int {
        get {
            return NSCalendar.currentCalendar().component(.Year, fromDate: self)
        }
    }
    
    public func dateBySettingYear(year:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateBySettingUnit(.Year, value:year, ofDate: self, options: .WrapComponents)
    }
    
    public var month:Int {
        get {
            return NSCalendar.currentCalendar().component(.Month, fromDate: self)
        }
    }
    
    public func dateBySettingMonth(month:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateBySettingUnit(.Month, value:month, ofDate: self, options: .WrapComponents)
    }
    
    public var day:Int {
        get {
            return NSCalendar.currentCalendar().component(.Day, fromDate: self)
        }
    }
    
    public func dateBySettingDay(day:Int) -> NSDate? {
        return NSCalendar.currentCalendar().dateBySettingUnit(.Day, value:day, ofDate: self, options: .WrapComponents)
    }
}
