//
//  OffsetAndPosition.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/28.
//

import SwiftUI

struct OffsetAndPosition: View {
    var body: some View {
        ZStack{
            Text("OffsetAndPosition")
                .offset(x: 0, y: 0)
            Rectangle()
                .frame(width: 10, height: 10)
            Text("OffsetAndPosition")
                .offset(x: 10, y: 10)
            
            Text("OffsetAndPosition")
                .position(x: 0, y: 0)
        }
        .ignoresSafeArea()
    }
}

struct ExamplePosition: View {
    var body: some View {

        ZStack {
            Text("0, 0")
                .background(.red, ignoresSafeAreaEdges: [])
                .position(x: 0, y: 0)
            
            Text("I'm Offset Example")
                .padding()
                .background(.green)
                .position(x: 200, y: 200)
            
            Rectangle()
                .frame(width: 200, height: 200)

        }
        .ignoresSafeArea()
        
    }
}

struct ExampleOffset: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.gray)
                .frame(width: 50, height: 50)
                .offset(x: 0, y: 0)
            
            Text("(0, 0)")
                .offset(x: 0, y: 0)
                .background(.purple)
            
            Text("I'm Offset Example")
                .padding()
                .background(.pink)
                .offset(x: 50, y: 50)
/*
 rootview > offset > background(pink) > padding > text
 text는 자신의 범위만큼 반환 > padding
 padding은 text bounds + default padding bounds > background(pink)
 padding bounds == backgrounds bounds, background 중앙에 배치
 background > rootView, rootView 중앙에 배치
 
 */
        }
    }
}

#Preview {
//    ExamplePosition()
    ExampleOffset()
}
