//
//  NSDate.swift
//  common-extentions
//
//  Created by Martin Eberl on 07.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

public func < (first: Date, second: Date) -> Bool {
    return first.compare(second) == .orderedAscending
}

public func > (first: Date, second: Date) -> Bool {
    return first.compare(second) == .orderedDescending
}

public func <= (first: Date, second: Date) -> Bool {
    let cmp = first.compare(second)
    return cmp == .orderedAscending || cmp == .orderedSame
}

public func >= (first: Date, second: Date) -> Bool {
    let cmp = first.compare(second)
    return cmp == .orderedDescending || cmp == .orderedSame
}

public func == (first: Date, second: Date) -> Bool {
    return first.compare(second) == .orderedSame
}

public extension Date {

    public var year:Int {
        get {
            return (Calendar.current as NSCalendar).component(.year, from: self)
        }
    }
    
    public func dateBySettingYear(_ year:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(bySettingUnit: .year, value:year, of: self, options: .wrapComponents)
    }
    
    public var month:Int {
        get {
            return (Calendar.current as NSCalendar).component(.month, from: self)
        }
    }
    
    public func dateBySettingMonth(_ month:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(bySettingUnit: .month, value:month, of: self, options: .wrapComponents)
    }
    
    public var day:Int {
        get {
            return (Calendar.current as NSCalendar).component(.day, from: self)
        }
    }
    
    public func dateBySettingDay(_ day:Int) -> Date? {
        return (Calendar.current as NSCalendar).date(bySettingUnit: .day, value:day, of: self, options: .wrapComponents)
    }
}
