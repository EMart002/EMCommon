//
//  UIView+EMKit.swift
//  common-extentions
//
//  Created by Martin Eberl on 14.06.16.
//  Copyright © 2016 Martin Eberl. All rights reserved.
//

import UIKit

@IBDesignable
public extension UIView {
    
    public var origin:CGPoint! {
        get {
            return self.frame.origin
        }
        set {
            var rect: CGRect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
    
    public var x: CGFloat! {
        get {
            return self.frame.minX
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    public var y: CGFloat! {
        get {
            return self.frame.minY
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    public var size:CGSize! {
        get {
            return self.frame.size
        }
        set {
            var rect: CGRect = self.frame
            rect.size = newValue
            self.frame = rect
        }
    }
    
    public var width: CGFloat! {
        get {
            return self.frame.width
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    public var height: CGFloat! {
        get {
            return self.frame.height
        }
        set(newValue) {
            var rect: CGRect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor;
        }
    }
    
    public func alignTop(_ offset: CGFloat!) {
        self.y = offset;
    }
    
    public func alignLeft(_ offset: CGFloat!) {
        self.x = offset;
    }
    
    public func alignRight(_ offset: CGFloat!) {
        self.x = self.superview!.frame.width - self.width - offset

    }
    
    public func alignRight(_ size:CGSize!, offset: CGFloat!) {
        self.x = size.width - self.width - offset
    }
    
    public func alignRight(_ rect:CGRect!, offset: CGFloat!) {
        self.x = rect.width - self.width - offset
    }
    
    public func alignBottom(_ offset: CGFloat!) {
        self.y = self.superview!.frame.height - self.height - offset
    }
    
    public func alignBottom(_ size:CGSize!, offset: CGFloat!) {
        self.y = size.height - self.height - offset
    }
    
    public func alignBottom(_ rect:CGRect!, offset: CGFloat!) {
        self.y = rect.height - self.height - offset
    }
    
    public func alignBelow(_ view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.y = brotherView.frame.maxY + offset
    }
    
    public func alignAbove(_ view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.y = brotherView.frame.minY - self.height - offset
    }
    
    public func alignTrailing(_ view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.x = brotherView.frame.maxX + offset
    }
    
    public func alignLeading(_ view:UIView!, offset:CGFloat!) {
        guard let brotherView = view where view.superview == self.superview else {
            print("Brotherview \(view) has not the same superview as self \(self)")
            return
        }
        self.x = brotherView.frame.minX - self.width - offset
    }
    
    public func resizeHorizontal(_ leftOffset:CGFloat!, rightOffset:CGFloat!) {
        self.x = leftOffset
        self.width = self.superview!.frame.width - leftOffset - rightOffset
    }
    
    public func resizeHorizontal(_ firstView:UIView!, secondView:UIView!, leftOffset:CGFloat!, rightOffset:CGFloat!) {
        guard let firstBrotherView = firstView where firstView.superview == self.superview else {
            print("Brotherview \(firstView) hasnot the same superview as self \(self)")
            return
        }
        guard let secondBrotherView = secondView where secondView.superview == self.superview else {
            print("Brotherview \(secondView) has not the same superview as self \(self)")
            return
        }
        
        self.x = firstBrotherView.frame.maxX + leftOffset
        self.width = secondBrotherView.frame.minX - self.x - rightOffset
    }
    
    public func resizeVertical(_ topOffset:CGFloat!, bottomOffset:CGFloat!) {
        self.y = topOffset
        self.height = self.superview!.frame.height - topOffset - bottomOffset
    }
    
    public func resizeVertical(_ firstView:UIView!, secondView:UIView!, topOffset:CGFloat!, bottomOffset:CGFloat!) {
        guard let firstBrotherView = firstView where firstView.superview == self.superview else {
            print("Brotherview \(firstView) has not the same superview as self \(self)")
            return
        }
        guard let secondBrotherView = secondView where secondView.superview == self.superview else {
            print("Brotherview \(secondView) has not the same superview as self \(self)")
            return
        }
        
        self.y = firstBrotherView.frame.maxY + topOffset
        self.height = secondBrotherView.frame.minY - self.y - bottomOffset
    }
    
    public func centerHorizontal() {
        self.centerHorizontal(self.superview?.frame)
    }
    
    public func centerHorizontal(_ size: CGSize!) {
        self.x = (size.width - self.width) / 2
    }
    
    public func centerHorizontal(_ frame: CGRect!) {
        self.centerHorizontal(frame.size)
    }
    
    public func centerVertical() {
        self.centerVertical(self.superview?.frame)
    }
    
    public func centerVertical(_ size: CGSize!) {
        self.y = (size.height - self.height) / 2
    }
    
    public func centerVertical(_ frame: CGRect!) {
        self.centerVertical(frame.size)
    }
    
    public func assignX(_ view:UIView!) {
        view.x = self.x
    }
    
    public func assignY(_ view:UIView!) {
        view.y = self.y
    }
    
    public func assignWidth(_ view:UIView!) {
        view.width = self.width
    }
    
    public func assignHeight(_ view:UIView!) {
        view.height = self.height
    }
    
    public func verticalGradient(_ topColor:UIColor!, bottomColor:UIColor!) {
        let gradient = CAGradientLayer()
        gradient.colors = [topColor.CGColor, bottomColor.CGColor]
        gradient.locations = [0.0, 1.0]
        gradient.frame = self.bounds
        layer.insertSublayer(gradient, atIndex: 0)
    }
    
    public func removeEveryGradientLayer() {
        var i:Int = 0
        for subLayer in Array(layer.sublayers!) {
            if subLayer.isKindOfClass(CAGradientLayer) {
                layer.sublayers?.removeAtIndex(i)
                i = i - 1
            }
            i = i + 1
        }
    }
    
    public func firstGradientLayer() -> CAGradientLayer? {
        for subLayer in Array(layer.sublayers!) {
            if subLayer.isKindOfClass(CAGradientLayer) {
                return subLayer as! CAGradientLayer
            }
        }
        return nil
    }
}
