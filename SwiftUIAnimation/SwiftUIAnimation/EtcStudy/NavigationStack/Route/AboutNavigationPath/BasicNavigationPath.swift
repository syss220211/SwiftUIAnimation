//
//  BasicNavigationPath.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/09.
//

import SwiftUI

// NavigationPath 사용하기
class BasicNavigationPathState: ObservableObject {
    @Published var routes = NavigationPath()
}

// 앱의 초기 진입점 - Sample
struct BasicNavigationPath: View {
    
    @StateObject private var navigationState = BasicNavigationPathState()
    
    var body: some View {
        NavigationStack(path: $navigationState.routes) {
            BasicSecondNavigationPath()
                .environmentObject(navigationState)
                .navigationDestination(for: NavigationPathData.self) { value in
                    BasicNavigationPathDetailView(sample: value)
                }
                .navigationDestination(for: Int.self) { value in
                    BasicNavigationPathIntDetailView()
                }
        }
    }
}

#Preview {
    BasicNavigationPath()
}
