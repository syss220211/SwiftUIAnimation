//
//  AboutZStack.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/17.
//

import SwiftUI

struct AboutZStack: View {
    let colors: [Color] =
        [.red, .orange, .yellow, .green, .blue, .purple]


    var body: some View {
        ZStack {
            // 코드 상 윗줄부터 밑줄로 갈수록 위에 쌓이는 형태
            ForEach(0..<colors.count, id: \.self) {
                Rectangle()
                    .fill(colors[$0])
                    .frame(width: 100, height: 100)
                    .offset(x: CGFloat($0) * 10.0,
                            y: CGFloat($0) * 10.0)
            }
            Text("Rectangle Color!")
                .padding(10)
                .background(Color.white)
        }
        
        ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 50)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:50, height: 100)
            }
            .border(Color.green, width: 1)
    }
}

#Preview {
    AboutZStack()
}
