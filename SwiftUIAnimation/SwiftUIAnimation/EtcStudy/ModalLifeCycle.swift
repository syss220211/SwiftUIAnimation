//
//  ModalLifeCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct ModalLifeCycle: View {
    @State private var isTapped = false
    
    var body: some View {
        VStack {
            Text("첫 화면입니다.")
            Text("모달 띄우기")
                .onTapGesture {
                    isTapped.toggle()
                }
        }
        .sheet(isPresented: $isTapped, content: {
            SheetView()
        })
        .onAppear {
            print("🔥 첫번째 화면의 Onappear!")
        }
        .onDisappear {
            print("🔥 첫번째 화면의 onDisappear!")
        }
    }
}

#Preview {
    ModalLifeCycle()
}

struct SheetView: View {
    var body: some View {
        Text("모달로 이동한 두번째 뷰")
            .onAppear {
                print("🍀 두번째 화면의 Onappear!")
            }
            .onDisappear {
                print("🍀 두번째 화면의 onDisappear!")
            }
        // 유킷과 다르게 모달을 완전히 내려야 내려감
    }
}
