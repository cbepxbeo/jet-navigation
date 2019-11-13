//
// Project: JetNavigation
// File: JetNavigationLink.swift
// Created by: Egor Boyko
// Date: 12.11.2019
//
// Status: #In progress | #Not decorated

import SwiftUI


public struct JetNavigationLink<Destination, Label>:
    View where Destination: View, Label: View{
    
    @EnvironmentObject private var controller: JetNavigationController
    
    private let label: Label?
    private let destination: Destination?


    private let tag: String?
    private let action: JetNavigationAction?
    
    public init
    (
        destination: Destination,
        tag: String = UUID().uuidString,
        @ViewBuilder label: () -> Label
    )
    {
        self.destination = destination
        self.label = label()
        self.tag = tag
        self.action = nil
    }

            
    public var body: some View {
        Button {
            self.go()
        } label: {
            self.label
        }
    }
    
    private func go() {
        if action == nil {
            self.toTransition()
        } else {
            self.toAction()
        }
    }
    
    private func toTransition(){
        if self.destination != nil {
            controller.goTo(
                representation: destination,
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

extension JetNavigationLink where Destination == Never {
    
    public init
    (
        tag: String = UUID().uuidString,
        @ViewBuilder label: () -> Label
    )
    {
        self.destination = nil
        self.label = label()
        self.tag = tag
        self.action = nil
    }
    
    public init
    (
        action: JetNavigationAction = .back,
        @ViewBuilder label: () -> Label
    )
    {
        self.destination = nil
        self.label = label()
        self.tag = nil
        self.action = action
    }
}
