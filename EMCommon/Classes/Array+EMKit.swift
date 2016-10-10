//
//  Array.swift
//  common-extentions
//
//  Created by Martin Eberl on 27.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

public extension Array {
    public func shiftRight( _ amount: Int = 1) -> [Element] {
        var amountMutable = amount
        assert(-count...count ~= amountMutable, "Shift amount out of bounds")
        if amountMutable < 0 { amountMutable += count }  // this needs to be >= 0
        return Array(self[amountMutable ..< count] + self[0 ..< amountMutable])
    }
    public func reverseShift( _ amount: Int = 1) -> [Element] {
        var amountMutable = amount
        amountMutable = count-amountMutable-1
        let a: [Element] = self.reverse()
        return a.shiftRight(amountMutable)
    }
    public mutating func shiftItemAtIndex(index:Int, toIndex:Int) -> [Element] {
        let element = self[index]
        if toIndex < index {
            insert(element, atIndex: toIndex)
            removeAtIndex(index + 1)
        } else {
            if toIndex + 1 >= count {
                append(element)
            }
            else {
                insert(element, atIndex: toIndex + 1)
            }
            removeAtIndex(index)
        }
        return self
    }
    
    public mutating func shiftRightInPlace(_ amount: Int = 1) {
        self = shiftRight(amount)
    }
    
    public mutating func reverseShiftInPlace(_ amount: Int = 1) {
        self = reverseShift(amount)
    }
}
