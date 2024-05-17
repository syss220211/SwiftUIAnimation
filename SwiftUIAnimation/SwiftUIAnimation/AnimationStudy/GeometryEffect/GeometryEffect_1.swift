//
//  GeometryEffect_1.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/24.
//

import SwiftUI


/*
 What Geometry?
 - SwiftUI에서 뷰의 형태와 배치에 영향을 미치는 효과를 정의하는데 사용하는 프로토콜
 - 뷰의 형태, 위치 및 크기 변경 가능
 - effectValue(size: ) 메서드를 구현해야 프로토콜을 채택할 수 있으며, 해당 메서드는 뷰의 크키가 변경될때마다 호출되고, 현재 뷰의 상태를 나타내는 값을 반환함
 */

// 뷰의 위치를 조정하는 사용자 효과 만들기

struct OffsetEffect: GeometryEffect {
    var offset: CGSize
    
    var animatableData: CGSize {
        get { offset }
        set { offset = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: offset.width, y: offset.height))
    }
}


struct GeometryEffect_1: View {
    @State private var xOffset: CGFloat = 0
    @State private var yOffset: CGFloat = 0
    @State private var rectangleColor: Color = .black
    
    var body: some View {
        Rectangle()
            .foregroundColor(rectangleColor)
            .frame(width: 100, height: 100)
//            .modifier(OffsetEffect(offset: CGSize(width: xOffset, height: yOffset)))
            .gesture(
                DragGesture()
                    .onChanged { value in
                        xOffset = value.translation.width // value.location.x
                        yOffset = value.translation.height //value.location.y
                        
                        print("🚀 \(value.translation.width)")
                        print("🚀🚀 \(value.translation.height)")
                    }
                    .onEnded { value in
                        xOffset = value.location.x
                        yOffset = value.location.y
                        
                        print("🔥 \(value.location.x)")
                        print("🔥🔥 \(value.location.y)")
                    }
            )
    }
}

#Preview {
    GeometryEffect_1()
}
