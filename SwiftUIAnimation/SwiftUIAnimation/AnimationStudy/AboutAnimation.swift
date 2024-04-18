//
//  AboutAnimation.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/28.
//

import SwiftUI

struct AboutAnimation: View {
    var animationTest: Animation = .linear(duration: 0.5)
    
    @State private var scale = 0.5
    @State private var isTrailing = false
    @State private var degrees3D = Double.zero
    @State private var degrees = Double.zero
    
    var body: some View {
        VStack {
            Circle()
                // .scaleEffect(scale, anchor: .bottomLeading)
                .scaleEffect(scale)
                .animation(.easeIn, value: scale)
                .frame(width: 50, height: 50)
                
            /*
             .scaleEffect(scale, anchor: .bottomLeading) / .scaleEffect(scale)
             scaleEffect?
             : 앵커 포인트를 기준으로 가로 및 세로 방향 모두에서 지정된 양만큼 이 뷰의 렌더링된 출력 크기를 조정합니다.
             * anchor point? - .center, bottom, top, leading ... 등 어디 정렬인지. default = .center
             : 보통 뷰에 수평 및 수직 크기 조정 변환을 적용하는 데 사용됨
             : Shape Protocol을 만족해야 사용가능한 Modifier
             
             Circle은 scaleEffect로 인해서 resize가 가능
             Circle은 > Shape Protocol | Shape Protocol > Animatable Protocol
             */
            
            Circle()
                .scaleEffect(scale)
                .animation(.easeIn.repeatCount(3), value: scale) // repeatCount 애니메이션을 3번 반복하는 코드
                .frame(width: 50, height: 50)
            Circle()
                .scaleEffect(scale)
                .animation(.easeIn.delay(1), value: scale) // delay 애니메이션에 delay를 주는 코드
                .frame(width: 50, height: 50)
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
            
            // 값이 바인딩 될때 애니메이션 수행하기
            VStack(alignment: isTrailing ? .trailing : .leading) {
                Image(systemName: "box.truck")
                    .font(.system(size: 64))
                
                Toggle("트럭 이동하기",
                       isOn: $isTrailing.animation(.linear))
                // linear를 통해서 부드럽게 움직이는 애니메이션 추가
            }
            
            // default animation
            VStack {
                Spacer()
                Text("Hello")
                    .font(.largeTitle)
                    .rotation3DEffect(.degrees(degrees3D), axis: (x: 0, y: 1, z: 0))
                    
                // 360 도 회전하는 애니메이션
                Text("Hello")
                    .font(.largeTitle)
                    .rotationEffect(.degrees(degrees), anchor: .bottomLeading)
                    .animation(.default, value: degrees)
                
                Text("Hello")
                    .font(.largeTitle)
                    .rotationEffect(.degrees(degrees))
                    .animation(.spring, value: degrees)
                
                Spacer()
                Button("Animate") {
                    withAnimation {
                        degrees3D = (degrees3D == .zero) ? 180 : .zero
                        degrees = (degrees == .zero) ? 360 : .zero
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    AboutAnimation()
}
