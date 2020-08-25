//
// Project: JetNavigation
// File: JetNavigationTransition.swift
// Created by: Egor Boyko
// Date: 10.11.2019
//
// Status: #Completed | #Decorated
//

import SwiftUI

///Transitions between views
public enum JetNavigationTransition {
    
    ///Tuple, for initialization
    public typealias Transitions = (
        backward: AnyTransition,
        forward: AnyTransition,
        opacity: AnyTransition,
        identity: AnyTransition
    )
    
    ///To initialize using default settings
    case `default`
    ///To transition without animation
    case none
    ///For initialization based on a single transition
    case single(AnyTransition)
    /// For initialization based on two transitions
    case double(AnyTransition, AnyTransition)
    
    ///Default transitions
    static internal var defaultTransitions: Self.Transitions =
    (
        .asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing)
        ),
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        ),
        .opacity,
        .identity
    )
}
