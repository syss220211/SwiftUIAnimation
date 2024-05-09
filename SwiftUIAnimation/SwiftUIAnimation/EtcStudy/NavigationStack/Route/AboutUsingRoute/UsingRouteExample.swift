//
//  UsingRouteExample.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/09.
//

import SwiftUI

enum UsingRoute: Hashable {
    case view1
    case view2
    case view3
    case view4
    case view5
}

class UsingRouteNavigationState: ObservableObject {
    @Published var routes: [UsingRoute] = []
    
    func popToRoot() {
        routes.removeAll()
    }
    
    func popTo(_ route: UsingRoute) {
        routes = Array(routes[0...routes.firstIndex(of: route)!])
        // routes 배열을 입력으로 들어온 route까지로 바꿔주기
    }
}

struct UsingRouteExample: View {
    
    @StateObject private var navigationState = UsingRouteNavigationState()
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            View1()
                .navigationDestination(for: UsingRoute.self, destination: { route in
                    switch route {
                    case .view1:
                        View1()
                    case .view2:
                        View2()
                    case .view3:
                        View3()
                    case .view4:
                        View4()
                    case .view5:
                        View5()
                    }
                })
        }
        .environmentObject(navigationState)
    }
}

#Preview {
    UsingRouteExample()
}
