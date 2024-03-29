//
// Project: JetNavigation
// File: JetNavigationButton.swift
// Created by: Egor Boyko
// Date: 18.08.2020
//
// Status: #Completed | #Decorated
//

import SwiftUI
/**
 The base type that conforms to the button style protocol. Required to initialize a link without specifying a style, without the need for further use.
*/
public struct JetNavigationButton : ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
