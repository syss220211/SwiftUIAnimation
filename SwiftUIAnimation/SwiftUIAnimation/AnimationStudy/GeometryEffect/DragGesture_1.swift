//
//  DragGesture_1.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/24.
//

import SwiftUI

struct DragGesture_1: View {

    @State var gestureState: GestureState = .init(initialValue: 1)
    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 100)
            .gesture(
                DragGesture()
                    .updating(gestureState, body: { value, state, trans in
                        print("dd")
                    })
            )
    }
}

#Preview {
    DragGesture_1()
}
