//
//  SUTabview.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/11/13.
//

import SwiftUI

struct SUTabview: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AppleHomeView()
                .tabItem {
                    Label("홈", image: "testtab")
                }
                .tag(0)
            
            AppleSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            AppleProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)
        }
    }
}

#Preview {
    SUTabview()
}
