//
// Project: JetNavigation
// File: JetNavigationView.swift
// Created by: Egor Boyko
// Date: 10.11.2019
//
// Status: #In progress | #Not decorated


import SwiftUI

public struct JetNavigationView <Content: View>: View {
    
    @StateObject private var controller: JetNavigationController
    
    private let transitions: JetNavigationTransition.Transitions
    private let root: Content

    private var transition: AnyTransition {
        switch self.controller.option {
        case .forward:
            return self.transitions.forward
        case .backward:
            return self.transitions.backward
        case .opacity:
            return self.transitions.opacity
        case .identity:
            return self.transitions.identity
        }
    }
    
    public var body: some View {
        if controller.current == nil {
            self.root
                .transition(transition)
                .environmentObject(controller)
        } else  {
            JetNavigationHeader(title: controller.current!.title){
                if true {
                    controller.current!.view
                        .transition(transition)
                }
            }
            .environmentObject(controller)
            .transition(transition)
        }
    }
    
    public init(
        externalController: JetNavigationExternalController? = nil,
        transition: JetNavigationTransition = .default,
        easing: Animation = Animation.easeOut(duration: 0.2),
        startOption: JetNavigationOption = .forward,
        @ViewBuilder root: () -> Content)
    {
        switch transition {
        case .single(let ani):
            self.transitions = (ani, ani, .opacity, .identity)
        case .double(let first, let second):
            self.transitions = (first, second, .opacity, .identity)
        case .none:
            self.transitions = (.identity, .identity, .opacity, .identity)
        default:
            self.transitions = JetNavigationTransition.defaultTransitions
        }
        
        self.root = root()
        let controller = JetNavigationController(easing, option: startOption)
        self._controller = StateObject(wrappedValue: controller)
        if var external = externalController{
            external.jetNavigationController = controller
        }
    }
}




