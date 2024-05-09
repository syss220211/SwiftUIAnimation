//
//  ModalLifeCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct ModalLifeCycle: View {
    
    @State private var isTapped = false
    @State private var text: String = "안녕"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("첫 화면입니다.")
            Text(text)
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
        .task {
            // View가 생성되지 전에 비동기 함수가 실행되는 부분일 뿐 Onappear보다 먼저 실행된다고 보장할 수 없음
            print("🔥🔥 첫 번째화면 task 시작!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.text = "잘가"
            }
            print("🔥🔥 첫 번째화면 task 끝!")
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
