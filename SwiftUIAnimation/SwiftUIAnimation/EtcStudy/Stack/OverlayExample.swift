//
//  ZStackExample.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/17.
//

import SwiftUI

struct OverlayExample: View {
    var body: some View {
        VStack {
            ZStack {
                Color.green
                
                Text("ZStack Text")
                    .padding(30)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .frame(height: 100)

            Text("Overlay Text")
                .padding(60)
                .background(Color.yellow)
                .overlay(alignment: .top) {
                    Text("overlay blue!")
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("obverlay Bottom trailing!")
                }
            // 여러 조건을 주고 싶다면 이렇게 따로따로 주면 됨
            
            Rectangle()
                .frame(width: 300, height: 100)
                .overlay(alignment: .topLeading) { Star(color: .red)}
                .overlay(alignment: .topTrailing) { Star(color: .yellow)}
                .overlay(alignment: .bottomLeading) { Star(color: .blue)}
                .overlay(alignment: .bottomTrailing) { Star(color: .green)}
                .overlay(alignment: .center) {
                    Star(color: .orange)
                    Text("만약 Text가 들어간다면?")
                        .foregroundStyle(Color.white)
                }
                .overlay(alignment: .center) {
                    Text("또 들어가면?")
                        .foregroundStyle(.red)
                        .background(.yellow)
                }
            
            Text("overlay 한 조건씩 사용하되, 위에서부터 차곡차곡 쌓인다!")
            
            Color.blue
                .frame(width: 200, height: 200)
                .overlay(alignment: .bottom) {
                    ZStack(alignment: .bottom) {
                        Circle()
                            .frame(width: 100, height: 100)
                        Star(color: .yellow)
                    }
                }
            
            Color.blue
                .frame(width: 200, height: 200)
                .overlay(alignment: .bottom) {
                    Circle()
                        .frame(width: 100, height: 100)
                }
                .overlay(alignment: .bottom) {
                    Star(color: .yellow)
                }
        }
        // overlay는 현재뷰를 기준으로 하위뷰를 하나씩 얹어줌
        // 전체가 아니라 해당 뷰만을 기준으로 작용함
    }
}

struct Star: View {
    var color: Color
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(color)
    }
}
#Preview {
    OverlayExample()
}
