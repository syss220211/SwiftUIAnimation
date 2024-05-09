//
//  BasicSecondNavigationPath.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/09.
//

import SwiftUI

struct BasicSecondNavigationPath: View {
    @EnvironmentObject private var navigationState: BasicNavigationPathState
    
    var body: some View {
        Button("NavigationPathData 추가") {
            navigationState.routes.append(NavigationPathData(title: "계절의 단상", content: "📕"))
        }
        
        Button("Int 데이터 추가") {
            navigationState.routes.append(2001)
        }
    }
}

// 버튼을 눌렀을 때 추가되어 이동하는 두번째 페이지
struct BasicNavigationPathDetailView: View {
    
    let sample: NavigationPathData
    var body: some View {
        Text("title: \(sample.title), content: \(sample.content)")
    }
}

struct BasicNavigationPathIntDetailView: View {
    var body: some View {
        Text("Here is Int Button View")
    }
}


// 프리뷰를 위한 코드 작업
#Preview {
    BasicSecondNavigationPathContainer()
}

struct BasicSecondNavigationPathContainer: View {
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
