//
// Project: JetNavigation
// File: JetNavigationHeader.swift
// Created by: Egor Boyko
// Date: 18.09.2020
//
// Status: #In progress | #Not decorated
//

import SwiftUI


extension JetNavigationHeader where RightButton == EmptyView {
    public init(
        title: String? = nil,
        actionRightButton: @escaping ()->() = {},
        rightButton: RightButton = RightButton(),
        style: JetNavigationHeaderStyle? = nil,
        @ViewBuilder _ content: () -> Content){
            self.content = content()
            self.title = title
            self.paddingTop = UIApplication
                .shared
                .windows
                .first?
                .safeAreaInsets.top ?? 0
            self._isOffsetedContent = State(initialValue: false)
            self._contentHeight = State(initialValue: UIScreen.main.bounds.height)
            self.style =
                style == nil ? JetNavigationHeaderStyleDefault() : style!
            self.actionRightButton = actionRightButton
            self.rightButton = rightButton
    }
}


public struct JetNavigationHeader<Content: View, RightButton: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject private var controller: JetNavigationController
    
    @State private var isOffsetedContent: Bool
    @State private var contentHeight: CGFloat
    private let title: String?
    private let content: Content
    private let rightButton: RightButton
    private let paddingTop: CGFloat
    private let style: JetNavigationHeaderStyle
    private let actionRightButton: ()->()
    

    
    
    var offsetForAnimationHeader: CGFloat {
        style.immediateAnimation ? 0 : contentHeight - fullHeightHeader
    }
    
    var fullHeightHeader: CGFloat {
        style.height.start + paddingTop
    }

    var height: CGFloat {
        isOffsetedContent ? style.height.end : style.height.start
    }
    
    var color: Color {
        isOffsetedContent
            ?   style.color.end == nil
                    ? colorScheme == .dark ? .black : .white
                    : style.color.end!
            :
                style.color.start == nil
                    ? colorScheme == .dark ? .black : .white
                    : style.color.start!
    }
    
    public var body: some View {
        if self.title != nil {
            self._viewContent
        } else {
            self.content
        }
    }
    
    public var _viewContent: some View {
        ZStack{
            Color.clear
            GeometryReader { proxy in

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0){
                        HStack{}
                            .padding(.bottom, fullHeightHeader)
                        content
                        Spacer()
                    }
                    .anchorPreference(
                        key: JetNavigationHeaderOffsetPreferenceKey.self,
                        value: .top) {
                            proxy[$0].y
                        }
                }
                .onAppear{
                    contentHeight = proxy.size.height
                }
            }
            .onPreferenceChange(
                JetNavigationHeaderOffsetPreferenceKey.self) { offset in
                    if offset < -offsetForAnimationHeader && !isOffsetedContent {
                        isOffsetedContent = true
                    }
                    if offset >= -offsetForAnimationHeader && isOffsetedContent {
                        isOffsetedContent = false
                    }
            }
        
            VStack(spacing: 0){
                VStack(spacing: 0){
                    HStack{
                        Group{
                            JetNavigationLink(action: .back) {
                                HStack{
                                    Image(systemName: "chevron.backward")
                                    Text("back")
                                        .lineLimit(1)
                                }
                            }
                        }
                        .frame(width: 80)
                        .mask(Rectangle())
                        Spacer()
                        Text(title!)
                        Spacer()
                        Group{
                            Button(action: actionRightButton, label: { rightButton })
                        }
                        .frame(width: 80)
                        .mask(Rectangle())
                       
                    }
                    .frame(height: height)
                    .padding(.top, paddingTop)
                }
                .background(color)
                .animation(.spring(), value: isOffsetedContent)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
    
}


fileprivate struct JetNavigationHeaderOffsetPreferenceKey: PreferenceKey {
    internal static var defaultValue: CGFloat = 0
    internal static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


fileprivate struct JetNavigationHeaderStyleDefault : JetNavigationHeaderStyle {
    internal let height: (start: CGFloat, end: CGFloat)
    internal let color: (start: Color?, end: Color?)
    internal let immediateAnimation: Bool
}
