//
// Project: JetNavigation
// File: JetNavigationController.swift
// Created by: Egor Boyko
// Date: 12.11.2019
//
// Status: #In progress | #Not decorated
//


import SwiftUI

public final class JetNavigationController: ObservableObject{
    
    @Published internal var current: JetNavigationViewWrapper?
    @Published private(set) var option: JetNavigationOption
    
    private let easing: Animation
    
    private var storage: JetNavigationStorage {
        didSet {
            withAnimation(self.easing) {
                self.current = self.storage.last
            }
        }
    }
    
    public init(_ easing: Animation, option: JetNavigationOption = .forward){
        self.easing = easing
        self.option = option
        self.storage = .init()
    }
    
    //MARK: Public methods
    
    ///Return to the root view
    /// - Parameter option: transition option (forward/backward/identity/opacity)
    public func home(option: JetNavigationOption? = nil){
        self.option = option == nil ? .backward : option!
        self.storage.removeAll()
    }
    
    ///Go back one screen
    /// - Parameter option: transition option (forward/backward/identity/opacity)
    public func back(option: JetNavigationOption? = nil){
        self.option = option == nil ? .backward : option!
        self.storage.removeLast()
    }
    
    ///Go to assigned screen
    /// - Parameter representation: Destination View
    /// - Parameter tag: unique tag for Destination Screen
    /// - Parameter option: transition option (forward/backward/identity/opacity)
    public func goTo<Representation: View>(
        representation: Representation,
        tag: String = UUID().uuidString,
        option: JetNavigationOption? = nil
    )
    {
        self.option = option == nil ? .forward : option!
        self.storage.append(
            JetNavigationViewWrapper(
                id: tag,
                view: AnyView(representation)
            )
        )
    }
    
    ///Go to the presented screen by tag
    /// - Parameter tag: screen tag
    /// - Parameter option: transition option (forward/backward/identity/opacity)
    public func goTo(tag: String, option: JetNavigationOption? = nil){
        self.option = option == nil ? .backward : option!
        self.storage.move(tag: tag)
    }
}
