//
//  AboutPadding.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/27.
//

import SwiftUI

struct AboutPadding: View {
    var body: some View {
        Text("About Padding")
            .background(.green)
            .padding(10)
            .background(.yellow)
        
        /*
         레이아웃 순서
         1. RootView -> background(yellow) -> padding(10) -> background(green) -> Text
         2. Text는 자신의 길이만큼 필요하다고 반환, text bounds -> background(green) bounds
         3. text bounds == backgrounds bounds, background는 해당 뷰를 자신의 뷰 중앙에 배치
         4. background(green) -> padding) padding은 자신의 10만큼을 더한 bounds를 background(yellow)에 반환
         *저번 예제에서 알 수 있듯이 여기서 padding은 자식뷰에게 애초에 10만큼을 제외한 뷰를 제공해버림 (왜냐? 나중에 그만큼 +하기 위해서)
         5. background(yellow)는 반환받은 bounds를 확인하고, 중립인 색상은 그만큼을 사용하겠다고 하고 자신의 뷰 중앙의 배치
         6. background(yellow) -> RootView) RootView 자식뷰의 레이아웃을 따름
         */
        
        
        Text("About Padding2")
            .background(.pink)
            .padding(10)
            .background(.gray)
            .padding(40)
            .background(.blue)
            .frame(width: 300, height: 300, alignment: .topLeading)
    }
}

#Preview {
    AboutPadding()
}
