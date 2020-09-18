//
// Project: JetNavigation
// File: JetNavigationHeader.swift
// Created by: Egor Boyko
// Date: 18.09.2020
//
// Status: #In progress | #Not decorated
//

import SwiftUI

struct JetNavigationHeader<Content: View>: View {
    
    private let content: Content
    
    public init(@ViewBuilder _ content: () -> Content){
        self.content = content()
    }
    
   @State var color: Color = .purple
    
    @State var offsetedContent: Bool = false
    @State var contentHeight: CGFloat = 100
    
    var offsetForAnimationHeader: CGFloat {
        contentHeight - (heightHeader + paddingTop)
    }
    let heightHeader: CGFloat = 60
    
    let paddingTop: CGFloat = UIApplication
        .shared
        .windows
        .first?
        .safeAreaInsets.top ?? 0
    
    
    public var body: some View {
        ZStack{
            color
            GeometryReader { proxy in

                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0){
                        HStack{}
                            .padding(.bottom, paddingTop + heightHeader)

                        content
           

                        Spacer()
                    }
                    .anchorPreference(key: OffsetPreferenceKey.self, value: .top) { proxy[$0].y }
                }
                .onAppear{
                    print(proxy.size.height)
                    self.contentHeight = proxy.size.height
                }
            }
            .onPreferenceChange(OffsetPreferenceKey.self) { offset in
                if offset < -offsetForAnimationHeader && !offsetedContent {
                    offsetedContent = true
                }
                if offset >= -offsetForAnimationHeader && offsetedContent {
                    offsetedContent = false
                }
            }
            
            VStack(spacing: 0){
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Text("Test Title")
                        Spacer()
                    }
                    .frame(height: offsetedContent ? heightHeader / 2 : heightHeader)
                    
                    .padding(.top, paddingTop)
                }
                .background(Color.yellow)
                .animation(.spring(), value: offsetedContent)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
    
}


fileprivate struct OffsetPreferenceKey: PreferenceKey {
    internal static var defaultValue: CGFloat = 0
    internal static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
