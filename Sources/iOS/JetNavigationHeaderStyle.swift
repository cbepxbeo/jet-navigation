//
// Project: JetNavigation
// File: JetNavigationHeaderStyle.swift
// Created by: Egor Boyko
// Date: 18.09.2020
//
// Status: #In progress | #Not decorated
//

import SwiftUI

public protocol JetNavigationHeaderStyle {
    var height: (start: CGFloat, end: CGFloat) { get }
    var color: (start: Color?, end: Color?) { get }
    var immediateAnimation: Bool { get }
    
    init(
        height: (start: CGFloat, end: CGFloat),
        color: (start: Color?, end: Color?),
        immediateAnimation: Bool
    )
}

public extension JetNavigationHeaderStyle {
    
    init(
        immediateAnimation: Bool = false,
        startHeight: CGFloat,
        endHeight: CGFloat? = nil,
        color: Color? = .clear){
            let endHeight = endHeight == nil ? startHeight / 2 : endHeight!
            self.init(
                height: (startHeight, endHeight),
                color: (color, color),
                immediateAnimation: immediateAnimation
            )
    }
    
    init(
        immediateAnimation: Bool = false,
        height: CGFloat? = nil,
        color: Color? = .clear){
            let height = height == nil ? 80 : height!
            self.init(
                height: (height, height),
                color: (color, color),
                immediateAnimation: immediateAnimation
            )
    }
    
    init(
        immediateAnimation: Bool = false,
        startHeight: CGFloat,
        endHeight: CGFloat? = nil,
        startColor: Color,
        endColor: Color? = nil){
            let endColor = endColor == nil ? startColor.opacity(0.5) : endColor!
            let endHeight = endHeight == nil ? startHeight / 2 : endHeight!
            self.init(
                height: (startHeight, endHeight),
                color: (startColor, endColor),
                immediateAnimation: immediateAnimation
            )
    }
    
    init(
        immediateAnimation: Bool = false,
        height: CGFloat? = nil,
        startColor: Color,
        endColor: Color? = nil){
            let endColor = endColor == nil ? startColor.opacity(0.5) : endColor!
            let height = height == nil ? 60 : height!
            self.init(
                height: (height, height),
                color: (startColor, endColor),
                immediateAnimation: immediateAnimation
            )
    }
    
    
    init(){ self.init( height: (90, 40), color: (nil, nil), immediateAnimation: true) }
    
}
