//
//  GobalNavigationStack.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/08.
//

import SwiftUI

struct GlobalNavigationSample: Hashable {
    let title: String
    let content: String
}

enum GlobalNavigationStackRoute: Hashable {
    case home
    case detail(GlobalNavigationSample)
}

class GobalNavigationState: ObservableObject {
    @Published var routes: [GlobalNavigationStackRoute] = []
}

struct GobalRootView: View {
    
    @StateObject private var  globalNavigationState = GobalNavigationState()
    
    var body: some View {
        NavigationStack(path: $globalNavigationState.routes) {
            GobalNavigationStack()
                .environmentObject(globalNavigationState)
                .navigationDestination(for: GlobalNavigationStackRoute.self) { route in
                    switch route {
                    case .home:
                        GlobalHomeView()
                    case .detail(let globalSampleData):
                        GlobalDetailView(sampleData: globalSampleData)
                    }
                }
        }
    }
}

struct GobalNavigationStack: View {
    @EnvironmentObject private var globalNavigationState: GobalNavigationState
    
    var body: some View {
        VStack {
            Button("Home") {
                globalNavigationState.routes.append(.home)
            }
            
            Button("Detail") {
                globalNavigationState.routes.append(
                    .detail(GlobalNavigationSample(title: "디테일", content: "디테일 어쩌구")))
            }
        }
    }
}

struct GlobalHomeView: View {

    var body: some View {
        Text("🏡")
    }
}

struct GlobalDetailView: View {
    
    let  sampleData: GlobalNavigationSample

    var body: some View {
        Text("🗓️ \(sampleData.title)")
        Text(sampleData.content)
    }
}

#Preview {
    NavigationStack {
        GobalRootView()
            .environmentObject(GobalNavigationState())
            .navigationDestination(for: GlobalNavigationStackRoute.self) { route in
                switch route {
                case .home:
                    Text("here is home!")
                case .detail(let globalSampleData):
                    Text(globalSampleData.title)
                    Text(globalSampleData.content)
                }
            }
    }
}
