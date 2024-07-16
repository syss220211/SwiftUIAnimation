//
//  CarouselTestView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/15.
//

import SwiftUI

public struct CarouselType: Identifiable {
    public let id = UUID().uuidString
    let color: Color
    let content: String
    
    static let data = [
        CarouselType(color: .red, content: "빨강"),
        CarouselType(color: .yellow, content: "노랑"),
        CarouselType(color: .blue, content: "파랑"),
        CarouselType(color: .green, content: "초록")
    ]
}
