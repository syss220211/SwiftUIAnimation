//
//  RootNaviStasck.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/19.
//

import SwiftUI

struct NavigationPathStudy: View {
    
    private let fruits = ["Apple", "Orange", "Banana"]
    @State private var stackPath: [String] = []
    
    var body: some View {
        // 전체 스택이 문자열의 대상값에 바인딩 되도록 설정되었음을 의미함
        NavigationStack(path: $stackPath) {
            VStack(spacing: 20) {
                Button("스택에 값 추가하기") {
                    stackPath.append(contentsOf: [
                        "Lemon", "Peach", "Coconut"
                    ])
                }
                
                ForEach(fruits, id: \.self) { fruit in
                    NavigationLink(value: fruit) {
                        Text(fruit)
                    }
                }
                
                // stackPath = String 전용, Int 에 걸려있는 NavigationStack은 동작하지 않음
                ForEach(0..<10) { x in
                    NavigationLink(value: x) {
                        Text("Click Click\(x)!!")
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { value in
                StackSecondView(value: value)
            })
            .navigationDestination(for: String.self) { value in
                Text("\(value) is delicious!")
            }
            .onChange(of: stackPath) {
                print(stackPath)
            }
        }
    }
}

#Preview {
    NavigationPathStudy()
}
