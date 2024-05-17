//
//  ZStackExample.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/17.
//

import SwiftUI

struct ZStackExample: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Color.yellow
                Text("Placeholder")
            }.frame(height: 100)
            
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 30)
                    .cornerRadius(10)
                Text("오버레이 텍스트")
            }.frame(height: 100)
            
            Text("오버레이 텍스트")
                .padding(10)
                .frame(height: 100)
                .background(.green)
                
            Rectangle()
                .fill(Color.red)
                .frame(width: 60, height: 60)
                .overlay (
                    Rectangle()
                        .fill(Color.orange)
                        .offset(x: 10, y: 10)
                )
            
            ZStack {
                Rectangle()
                    .fill(Color.cyan)
                    .frame(width: 60, height: 60)
                    .zIndex(1) // index 순서 바꾸기
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 60, height: 60)
                    .offset(x: 10, y: 10)
            }
            // 이렇게 ZStack은 {} 안에서 뷰들이 독립적으로 행동이 가능함
            // overlay는 조건을 주고 싶다면 {} {} 이렇게 따로따로 부여해야함
        }
    }
}

#Preview {
    ZStackExample()
}
