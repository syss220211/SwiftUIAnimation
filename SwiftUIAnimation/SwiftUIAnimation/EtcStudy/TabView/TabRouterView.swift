//
//  TabRouterView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/17.
//

import SwiftUI

struct TabRouterView<Content: View>: View {
    @StateObject var router: TabViewRouter = TabViewRouter()
    private let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                content
            }
            .navigationDestination(for: TabViewRouter.Route.self) { route in
                router.view(for: route)
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .environmentObject(router)
    }
}
