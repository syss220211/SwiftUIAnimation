//
//  NavigationStackMainView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/08.
//

import SwiftUI

struct NavigationStackMainView: View {
    
    @State private var numbers: [Int] = []
//    @State private var numbers: [Int] = [1, 2, 3]
    
    var body: some View {
        NavigationStack(path: $numbers) {
            VStack {
                Button("Navigation") {
                    numbers.append(99)
                }
                
                Button("Random") {
                    let randomInt = Int.random(in: 100...200)
                    numbers.append(randomInt)
                }
            }
            .navigationDestination(for: Int.self) { value in
//                Text("\(value)")
                NavigationStackMainTest(number: value)
            }
        }
//        @State private var input: String = ""
//        private let buttonPadding: EdgeInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
//        private let textfieldPadding: EdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
//        NavigationStack(path: $numbers) {
//            HStack(spacing: 20) {
//                TextField(text: $input) {
//                    Text("숫자 입력")
//                        .foregroundStyle(Color.white)
//                }
//                .navigationSampleModifier(size: textfieldPadding, color: .black, radius: 10, foregroundColor: .white)
//                
//                Button("+") {
//                    numbers.append(Int(input)!)
//                }
//                .navigationSampleModifier(size: buttonPadding, color: .yellow, radius: 10, foregroundColor: .black)
//            }
//            .padding(.horizontal, 30)
//            .navigationDestination(for: Int.self) { value in
//                Text("appended navigationstack \(value)")
//            }
//        }
    }
}

#Preview {
    NavigationStackMainView()
}

//struct sampleModifier: ViewModifier {
//
//    let size: EdgeInsets
//    let color: Color
//    let radius: CGFloat
//    let foregroundColor: Color
//    
//    func body(content: Content) -> some View {
//        content
//            .padding(size)
//            .foregroundStyle(foregroundColor)
//            .background(color)
//            .clipShape(RoundedRectangle(cornerRadius: radius))
//    }
//}
//
//extension View {
//    func navigationSampleModifier(size: EdgeInsets,
//                        color: Color,
//                        radius: CGFloat,
//                        foregroundColor: Color) 
//    -> some View {
//        self.modifier(sampleModifier(size: size, color: color, radius: radius, foregroundColor: foregroundColor))
//    }
//}

struct NavigationStackMainTest: View {
    let number: Int
    
    init(number: Int) {
        self.number = number
        print("두번째 뷰 init 완료")
    }
    
    var body: some View {
        Text("\(number)!!!")
    }
}
