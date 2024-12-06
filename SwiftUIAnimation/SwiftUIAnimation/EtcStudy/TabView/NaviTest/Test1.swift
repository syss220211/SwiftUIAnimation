//
//  Test1.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/18.
//

import SwiftUI

struct Test1: View {
    @State private var tab: TabInfoTest = .one
    
    var body: some View {
        TabRouterView {
            TabView(selection: $tab) {
                ForEach(TabInfoTest.allCases, id: \.self) { tab in
                    
                        tab.view
                    
                    .tabItem {
                        VStack {
                            Image(systemName: tab.image)
                            Text(tab.rawValue)
                        }
                    }
                    .tag(tab)
                }
            }
//            .overlay {
//                VStack {
//                    Spacer()
//                    HStack(spacing: 40) {
//                        ForEach(TabInfoTest.allCases, id: \.self) { value in
//                            VStack(spacing: 5) {
//                                Image(systemName: value.image)
//                                Text(value.rawValue)
//                            }
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .contentShape(RoundedRectangle(cornerRadius: 10))
//                            .onTapGesture {
//                                print(tab)
//                                tab = value
//                            }
//                        }
//                        .tag(tab.hashValue)
//                    }
//                    .zIndex(0)
//                }
//            }
//            .overlay(alignment: .bottom) {
//                HStack(spacing: 40) {
//                    ForEach(TabInfoTest.allCases, id: \.self) { value in
//                        VStack(spacing: 5) {
//                            Image(systemName: value.image)
//                            Text(value.rawValue)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .contentShape(RoundedRectangle(cornerRadius: 10))
//                        .onTapGesture {
//                            print(tab)
//                            tab = value
//                        }
//                    }
//                }
//                .background(Color.white)
//            }
        }
    }
}

#Preview {
    Test1()
}
