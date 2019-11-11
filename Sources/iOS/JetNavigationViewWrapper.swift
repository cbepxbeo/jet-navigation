//
// Project: JetNavigation
// File: JetNavigationViewWrapper.swift
// Created by: Egor Boyko
// Date: 10.11.2019
//
// Status: #Completed | #Decorated
//

import SwiftUI

///Wrapper over the view, for later storage
internal struct JetNavigationViewWrapper: Identifiable {
    
    ///id to access the view + Identifiable iteration capability
    internal let id: String
    ///Stored view
    internal let view: AnyView
    
    internal init(id: String, view: AnyView){
        self.id = id
        self.view = view
    }

}

//MARK: Equatable
extension JetNavigationViewWrapper: Equatable {
    
    static internal func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    
}
