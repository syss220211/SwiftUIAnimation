//
//  TabViewMain.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/17.
//

import SwiftUI

enum TabInfoTest: String, CaseIterable {
    case one = "one"
    case two = "two"
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .one:
            TabRouterView {
                TabView1()
            }
        case .two:
            TabRouterView {
                TabView2()
            }
        }
    }
    
    var image: String {
        switch self {
        case .one:
            return "heart.fill"
        case .two:
            return "star.fill"
        }
    }
}

struct TabViewMain: View {
    
    @State private var tab: TabInfoTest = .one
    
    var body: some View {
        VStack {
            TabView(selection: $tab) {
                ForEach(TabInfoTest.allCases, id: \.self) { tab in
                    tab.view
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    HStack(spacing: 40) {
                        ForEach(TabInfoTest.allCases, id: \.self) { value in
                            VStack(spacing: 5) {
                                Image(systemName: value.image)
                                Text(value.rawValue)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                print(tab)
                                tab = value
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    TabViewMain()
}
