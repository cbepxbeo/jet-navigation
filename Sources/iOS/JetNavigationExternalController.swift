//
// Project: JetNavigation
// File: JetNavigationExternalController.swift
// Created by: Egor Boyko
// Date: 16.08.2020
//
// Status: #In progress | #Not decorated
//

import SwiftUI

///Allows you to control navigation outside of the JetNavigationView
public protocol JetNavigationExternalController {
    ///Controller
    var jetNavigationController: AnyObject? { get set }
}

extension JetNavigationExternalController {
    ///Controller
    private var controller: JetNavigationController? {
        jetNavigationController as? JetNavigationController
    }
    ///Go back one screen
    /// - Parameter option: transition option (forward/backward)
    public func back(option: JetNavigationOption = .backward){
        controller?.back(option: option)
    }
    ///Return to the root view
    /// - Parameter option: transition option (forward/backward)
    public func home(option: JetNavigationOption = .backward){
        controller?.home(option: option)
    }
    ///Go to assigned screen
    /// - Parameter representation: Destination View
    /// - Parameter tag: unique tag for Destination Screen
    /// - Parameter option: transition option (forward/backward)
    public func goTo<Representation: View>(
        representation: Representation,
        tag: String = UUID().uuidString,
        option: JetNavigationOption = .forward)
    {
        controller?.goTo(representation: representation, tag: tag, option: option)
    }
    ///Go to the assigned screen by tag
    /// - Parameter tag: screen tag
    /// - Parameter option: transition option (forward/backward)
    public func goTo(tag: String, option: JetNavigationOption = .backward){
        controller?.goTo(tag: tag, option: option)
    }
}
