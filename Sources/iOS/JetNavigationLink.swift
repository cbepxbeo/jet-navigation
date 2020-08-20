//
// Project: JetNavigation
// File: JetNavigationLink.swift
// Created by: Egor Boyko
// Date: 12.11.2019
//
// Status: #In progress | #Not decorated

import SwiftUI

public struct JetNavigationLink<Destination, Label, Style>:
    View where Destination: View, Label: View, Style: ButtonStyle {
    ///Navigation Controller
    @EnvironmentObject private var controller: JetNavigationController
    ///Link Label
    private let label: Label?
    ///Button style
    private let style: Style?
    ///Button name
    private let buttonName: String?
    ///transition view
    private let destination: (() -> Destination)?
    ///Unique tag to designate a view
    private let tag: String?
    ///Transition action option (back/home)
    private let action: JetNavigationAction?
                
    public var body: some View {
        _viewButton
    }
    
    //MARK: Methods
    private func go() {
        action == nil ? self.toTransition() : self.toAction()
    }
    
    private func toTransition(){
        if self.destination != nil {
            controller.goTo(
                representation: destination!(),
                tag: self.tag!)
        } else {
            self.controller.goTo(tag: self.tag!)
        }
    }
    
    private func toAction(){
        switch self.action! {
        case .back:
            self.controller.back()
        case .home:
            self.controller.home()
        }
    }
}

//MARK: Representation Logic
extension JetNavigationLink {
    
    private var _viewButton: some View {
        Group{
            if self.style != nil && self.buttonName != nil {
                _viewStateButtonWithoutLabel
            } else if self.label != nil {
                _viewStateButtonWithLabel
            } else {
                Text("Unintended state")
            }
        }
    }
    
    private var _viewStateButtonWithLabel: some View {
        Button(action: self.go){
            self.label!
        }
    }
    
    private var _viewStateButtonWithoutLabel: some View {
        Button(self.buttonName!){
            self.go()
        }
        .buttonStyle(self.style!)
    }
}



//MARK: Initialization without style
extension JetNavigationLink where Style == JetNavigationButton {
    /**
     Designed to initialize a link that accepts a destination and a label, without a style.
     - parameter destination: Transition View
     - parameter tag: Unique tag to designate a view
     - parameter label: Link Label
     - Note: It is necessary to manually control the uniqueness of the tag
    */
    public init(
        @ViewBuilder destination: @escaping () -> Destination,
        tag: String = UUID().uuidString,
        @ViewBuilder label: () -> Label) {
            self.destination = destination
            self.label = label()
            self.tag = tag
            self.action = nil
            self.buttonName = nil
            self.style = nil
    }
}

//MARK: Initialization without destination and style
extension JetNavigationLink where Destination == Never, Style == JetNavigationButton {
    /**
     Designed to navigate to a previously saved view by the destination tag. Accepts label for styling.
     - parameter tag: Unique tag to designate a view
     - parameter label: Link Label
     - Note: If the tag is not unique, the end result will be undefined. At the time the view is received, the first tag that matches will be used. If the tag is not found, it will navigate back.
    */
    public init(
        tag: String,
        @ViewBuilder label: () -> Label) {
            self.destination = nil
            self.label = label()
            self.tag = tag
            self.action = nil
            self.buttonName = nil
            self.style = nil
    }
    /**
     Designed to move through the action. Accepts label for styling.
     - parameter action: Transition action option (back/home)
     - parameter label: Link Label
    */
    public init(
        action: JetNavigationAction = .back,
        @ViewBuilder label: () -> Label) {
            self.destination = nil
            self.label = label()
            self.tag = nil
            self.action = action
            self.buttonName = nil
            self.style = nil
    }
}

//MARK: Initialization without a label
extension JetNavigationLink where Label == Never {
    /**
     Designed to move through the action. Accepts a button style and a title.
     - parameter buttonName: Button title
     - parameter style: Button Style
     - parameter action: Transition action option (back/home)
    */
    public init(
        _ buttonName: String,
        style: Style,
        action: JetNavigationAction = .back) {
            self.destination = nil
            self.label = nil
            self.tag = nil
            self.action = action
            self.buttonName = nil
            self.style = nil
    }
    /**
     Designed to navigate to a previously saved view by the destination tag. Accepts a button style and a title.
     - parameter buttonName: Button title
     - parameter style: Button Style
     - parameter tag: Unique tag to designate a view
     - Note: If the tag is not unique, the end result will be undefined. At the time the view is received, the first tag that matches will be used. If the tag is not found, it will navigate back.
    */
    public init(
        _ buttonName: String,
        style: Style,
        tag: String) {
            self.destination = nil
            self.label = nil
            self.tag = nil
            self.action = nil
            self.buttonName = nil
            self.style = nil
    }
    /**
     Designed to initialize a link that accepts a destination. Accepts a button style and a title.
     - parameter buttonName: Button title
     - parameter style: Button Style
     - parameter destination: Transition View
     - Note: It is necessary to manually control the uniqueness of the tag
    */
    public init(
        _ buttonName: String,
        style: Style,
        tag: String = UUID().uuidString,
        @ViewBuilder destination: @escaping () -> Destination) {
            self.destination = nil
            self.label = nil
            self.tag = nil
            self.action = nil
            self.buttonName = nil
            self.style = nil
    }
}
