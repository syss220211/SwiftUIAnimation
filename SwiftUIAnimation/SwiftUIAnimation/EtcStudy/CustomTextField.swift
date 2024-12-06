//
//  CustomTextField.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/10/27.
//

import SwiftUI

struct CustomTextField: View {
    @State private var text: String = ""
        
        var body: some View {
            VStack {
                TextField(
                    "내용입력", // Placeholder
                    text: $text
                )
                .padding()
                .foregroundColor(dynamicTextColor(for: text.count)) // 입력 길이에 따라 색상 설정
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .padding()
            }
            .padding()
        }
        
    func dynamicTextColor(for length: Int) -> Color {
           // 10글자 이상일 때는 색상을 빨간색으로 고정
           if length > 10 {
               return .red
           } else if length > 0 {
               // 0글자보다 큰 경우에만 변화
               let colorProgress = Double(length) / 10.0 // 10글자를 기준으로 비율 계산
               return Color(
                   red: colorProgress,   // 길이에 따라 빨간색 비율 증가
                   green: 1.0 - colorProgress, // 길이에 따라 초록색 비율 감소
                   blue: 0.0
               )
           }
           return .green // 입력이 없는 경우 초록색
       }
}

#Preview {
    CustomTextField()
}
