//
//  TabViewRouter.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/17.
//

import SwiftUI

class TabViewRouter: ObservableObject {
    enum Route: Hashable, Identifiable {
        var id: Self { self }
        case oneOne
        case twoTwo
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    @ViewBuilder func view(for route: Route) -> some View {
        switch route {
        case .oneOne:
            TabView3()
        case .twoTwo:
            TabView4()
        }
    }
    
    func navigateTo(_ page: Route) {
        path.append(page)
    }
    
    func navigateBack() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func replaceNavigationStack(_ page: Route) {
        path.removeLast(path.count)
        path.append(page)
    }
}
