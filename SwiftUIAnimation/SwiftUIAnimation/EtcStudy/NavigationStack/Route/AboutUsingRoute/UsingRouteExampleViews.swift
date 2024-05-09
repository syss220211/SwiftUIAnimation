//
//  UsingRouteExampleViews.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/09.
//

import SwiftUI

// MARK: - UsingRouteExample에서 사용하는 View1 ~ View5 모음

struct View1: View {
    @EnvironmentObject private var navigationState: UsingRouteNavigationState
    
    var body: some View {
        Button("View2") {
            navigationState.routes.append(.view2)
        }
        .navigationTitle("Here is View1")
    }
}

struct View2: View {
    @EnvironmentObject private var navigationState: UsingRouteNavigationState
    
    var body: some View {
        Button("View3") {
            navigationState.routes.append(.view3)
        }
        .navigationTitle("Here is View2")
    }
}

struct View3: View {
    @EnvironmentObject private var navigationState: UsingRouteNavigationState
    
    var body: some View {
        Button("View4") {
            navigationState.routes.append(.view4)
        }
        .navigationTitle("Here is View3")
    }
}

struct View4: View {
    @EnvironmentObject private var navigationState: UsingRouteNavigationState
    
    var body: some View {
        Button("View5") {
            navigationState.routes.append(.view5)
        }
        .navigationTitle("Here is View4")
    }
}

struct View5: View {
    @EnvironmentObject private var navigationState: UsingRouteNavigationState
    
    var body: some View {
        VStack {
            Button("Go to Root View") {
                navigationState.popToRoot()
            }
            
            Button("View 2") {
                navigationState.popTo(.view2)
            }
        }
        .navigationTitle("Here is View5")
    }
}

// MARK: - 프리뷰 작업용
struct UsingRouteContainerView: View {
    
    @StateObject private var navigationState = UsingRouteNavigationState()
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            View1()
                .environmentObject(navigationState)
                .navigationDestination(for: UsingRoute.self) { route in
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
                }
        }
       
    }
}

#Preview {
    NavigationStack {
        UsingRouteContainerView()
    }
}
