//
//  NavigationInitChecking.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/08.
//

import SwiftUI

struct NavigationInitChecking: View {
    let fruits = ["Apple", "Orange", "Banana"]
    
    var body: some View {
        NavigationStack {
            ScrollView { // List도 동일
                ForEach(0..<3) { x in
                    NavigationLink(value: x) {
                        Text("🍀 데이터 타입을 지정하는 경우(value) \(x) 번째")
                            .modifier(TTModifier(fontColor: .white, background: .black))
                    }
                }
                
                ForEach(0..<3) { x in
                    NavigationLink {
                        FFView(value: x)
                    } label: {
                        Text("🔥 데이터 타입 지정 없는 경우(destination) \(x)번째")
                            .modifier(TTModifier(fontColor: .black, background: .yellow))
                    }
                }
            }
            .navigationDestination(for: Int.self, destination: { value in
                FView(value: value)
            })
        }
    }
}

#Preview {
    NavigationInitChecking()
}

struct FView: View {
    
    private let value: Int
    init(value: Int) {
        self.value = value
        print("🍀 \(value) View init")
    }
    
    var body: some View {
        Text("\(value)번째 View")
    }
}

struct FFView: View {
    
    private let value: Int
    init(value: Int) {
        self.value = value
        print("🔥 \(value) View init")
    }
    
    var body: some View {
        Text("\(value)번째 View")
    }
}

struct TTModifier: ViewModifier {
    
    let fontColor: Color
    let background: Color
    
    func body(content: Content) -> some View {
        content
            .padding(5)
            .background(background)
            .foregroundColor(fontColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
