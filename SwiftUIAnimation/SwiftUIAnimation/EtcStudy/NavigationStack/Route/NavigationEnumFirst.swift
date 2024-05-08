//
//  NavigationEnumFirst.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/08.
//

import SwiftUI

struct FirstRouteSample: Hashable {
    let title: String
    let content: String
}

enum NavigationEnumFirstRoute: Hashable {
    case home
    case detail(FirstRouteSample)
    case mypage
}

struct NavigationEnumFirst: View {
    @State private var routes: [NavigationEnumFirstRoute] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                Button("Home") {
                    routes.append(.home)
                }
                
                Button("Detail") {
                    routes.append(.detail(FirstRouteSample(title: "Detail", content: "🍀")))
                }
                
                Button("Mypage") {
                    routes.append(.mypage)
                }
            }
            .navigationDestination(for: NavigationEnumFirstRoute.self) { route in
                switch route {
                case .home:
                    Text("here is home!")
                case .detail(let sample):
                    Text(sample.title)
                    Text(sample.content)
                case .mypage:
                    Text("here is mypage")
                }
            }
        }
    }
}

#Preview {
    NavigationEnumFirst()
}
