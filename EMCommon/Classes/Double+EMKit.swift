//
//  Double.swift
//  common-extentions
//
//  Created by Martin Eberl on 06.07.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import Foundation

func *(lhs:Double, rhs:Int) -> Double {
    return lhs * Double(rhs)
}

func *(lhs:Int, rhs:Double) -> Double {
    return Double(lhs) * rhs
}