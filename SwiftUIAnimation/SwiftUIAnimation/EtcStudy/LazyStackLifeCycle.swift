//
//  StackLifeCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct LazyStackLifeCycle: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("첫 번째 화면입니다.")
                    .padding(.bottom, 30)
                VStack(spacing: 30) {
                    ForEach(0..<10) { x in
                        // NavigationLink-value 를 사용해야 뷰가 lazy로 구현된다 (메모리 효율 상승)
                        NavigationLink(value: x) {
                            Text("Click Click\(x)!!")
                        }
                        
                        // 이런 Destination으로 생성 시 StackSecondView 불필요한 초기화 모두 진행됨
//                        NavigationLink {
//                            StackSecondView(value: x)
//                        } label: {
//                            Text("Click \(x)!!")
//                        }
                        
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { value in
                StackSecondView(value: value)
            })
            .onAppear {
                print("🔥 첫번째뷰 onAppear!!")
            }
            .onDisappear {
                print("🔥 첫번째뷰 onDisappear!!")
            }
        }
    }
}


struct StackSecondView: View {
    
    private let value: Int
    
    init(value: Int) {
        self.value = value
        print("\(value) 번째 View 생성 완료 ")
    }
    
    var body: some View {
        Text("\(value)번째 View")
            .onAppear {
                print("🍀 두번째뷰 onAppear!!")
            }
            .onDisappear {
                print("🍀 두번째뷰 onDisappear!!")
            }
    }
}

#Preview {
    LazyStackLifeCycle()
}
