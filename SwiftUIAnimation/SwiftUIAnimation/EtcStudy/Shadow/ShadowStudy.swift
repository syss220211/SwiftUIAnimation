//
//  ShadowStudy.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/18.
//

import SwiftUI

struct ShadowStudy: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.pink)
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .overlay {
                    Text("Rectangle")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ShadowStudy()
}
