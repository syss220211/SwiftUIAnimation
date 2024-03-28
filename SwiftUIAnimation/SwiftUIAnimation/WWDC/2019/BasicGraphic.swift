//
//  BasicGraphic.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/28.
//

import SwiftUI


// https://developer.apple.com/videos/play/wwdc2019/237/?time=815

struct BasicGraphic: View {
    var body: some View {
        let spectrum = Gradient(colors: [.red, .yellow, .green, .cyan, .blue, .purple, .red])
        
        let coinc = AngularGradient(gradient: spectrum, center: .center, angle: .degrees(-90))
        
        Rectangle()
            .fill(spectrum)
        
        Circle().fill(coinc)
        Circle().strokeBorder(coinc, lineWidth: 50)
        
    }
}

#Preview {
    BasicGraphic()
}
