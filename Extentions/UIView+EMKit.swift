//
//  UIView+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 14.06.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    var origin:CGPoint! {
        get {
            return self.frame.origin
        }
        set {
            var rect: CGRect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
    
    var x: CGFloat! {
        get {
            return CGRectGetMinX(self.frame)
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var y: CGFloat! {
        get {
            return CGRectGetMinY(self.frame)
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var size:CGSize! {
        get {
            return self.frame.size
        }
        set {
            var rect: CGRect = self.frame
            rect.size = newValue
            self.frame = rect
        }
    }
    
    var width: CGFloat! {
        get {
            return CGRectGetWidth(self.frame)
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height: CGFloat! {
        get {
            return CGRectGetHeight(self.frame)
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor;
        }
    }
    
    func alignTop(offset: CGFloat!) {
        self.y = offset;
    }
    
    func alignLeft(offset: CGFloat!) {
        self.x = offset;
    }
    
    func alignRight(offset: CGFloat!) {
        self.x = CGRectGetWidth(self.superview!.frame) - self.width - offset

    }
    
    func alignRight(size:CGSize!, offset: CGFloat!) {
        self.x = size.width - self.width - offset
    }
    
    func alignRight(rect:CGRect!, offset: CGFloat!) {
        self.x = CGRectGetWidth(rect) - self.width - offset
    }
    
    func alignBottom(offset: CGFloat!) {
        self.y = CGRectGetHeight(self.superview!.frame) - self.height - offset
    }
    
    func alignBottom(size:CGSize!, offset: CGFloat!) {
        self.y = size.height - self.height - offset
    }
    
    func alignBottom(rect:CGRect!, offset: CGFloat!) {
        self.y = CGRectGetHeight(rect) - self.height - offset
    }
    
    func alignBelow(view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.y = CGRectGetMaxY(brotherView.frame) + offset
    }
    
    func alignAbove(view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.y = CGRectGetMinY(brotherView.frame) - self.height - offset
    }
    
    func alignTrailing(view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.x = CGRectGetMaxX(brotherView.frame) + offset
    }
    
    func alignLeading(view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.x = CGRectGetMinX(brotherView.frame) - self.width - offset
    }
    
    func resizeHorizontal(leftOffset:CGFloat!, rightOffset:CGFloat!) {
        self.x = leftOffset
        self.width = CGRectGetWidth(self.superview!.frame) - leftOffset - rightOffset
    }
    
    func resizeHorizontal(firstView:UIView!, secondView:UIView!, leftOffset:CGFloat!, rightOffset:CGFloat!) {
        guard let firstBrotherView = firstView where firstView.superview == self.superview else {
            print("Brotherview \(firstView) has not the same superview as self \(self)")
            return
        }
        guard let secondBrotherView = secondView where secondView.superview == self.superview else {
            print("Brotherview \(secondView) has not the same superview as self \(self)")
            return
        }
        
        self.x = CGRectGetMaxX(firstBrotherView.frame) + leftOffset
        self.width = CGRectGetMinX(secondBrotherView.frame) - self.x - rightOffset
    }
    
    func resizeVertical(topOffset:CGFloat!, bottomOffset:CGFloat!) {
        self.y = topOffset
        self.height = CGRectGetHeight(self.superview!.frame) - topOffset - bottomOffset
    }
    
    func resizeVertical(firstView:UIView!, secondView:UIView!, topOffset:CGFloat!, bottomOffset:CGFloat!) {
        guard let firstBrotherView = firstView where firstView.superview == self.superview else {
            print("Brotherview \(firstView) has not the same superview as self \(self)")
            return
        }
        guard let secondBrotherView = secondView where secondView.superview == self.superview else {
            print("Brotherview \(secondView) has not the same superview as self \(self)")
            return
        }
        
        self.y = CGRectGetMaxY(firstBrotherView.frame) + topOffset
        self.height = CGRectGetMinY(secondBrotherView.frame) - self.y - bottomOffset
    }
    
    func centerHorizontal() {
        self.centerHorizontal(self.superview?.frame)
    }
    
    func centerHorizontal(size: CGSize!) {
        self.x = (size.width - self.width) / 2
    }
    
    func centerHorizontal(frame: CGRect!) {
        self.centerHorizontal(frame.size)
    }
    
    func centerVertical() {
        self.centerVertical(self.superview?.frame)
    }
    
    func centerVertical(size: CGSize!) {
        self.y = (size.height - self.height) / 2
    }
    
    func centerVertical(frame: CGRect!) {
        self.centerVertical(frame.size)
    }
    
    func assignX(view:UIView!) {
        view.x = self.x
    }
    
    func assignY(view:UIView!) {
        view.y = self.y
    }
    
    func assignWidth(view:UIView!) {
        view.width = self.width
    }
    
    func assignHeight(view:UIView!) {
        view.height = self.height
    }
    
    func verticalGradient(topColor:UIColor!, bottomColor:UIColor!) {
        var gradient = CAGradientLayer()
        gradient.colors = [topColor.CGColor, bottomColor.CGColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        layer.insertSublayer(gradient, atIndex: 0)
    }
    
    func removeEveryGradientLayer() {
        var i:Int = 0
        for subLayer in Array(layer.sublayers!) {
            if subLayer.isKindOfClass(CAGradientLayer) {
                layer.sublayers?.removeAtIndex(i)
                i = i - 1
            }
            i = i + 1
        }
    }
    
    func firstGradientLayer() -> CAGradientLayer? {
        for subLayer in Array(layer.sublayers!) {
            if subLayer.isKindOfClass(CAGradientLayer) {
                return subLayer as! CAGradientLayer
            }
        }
        return nil
    }
}
