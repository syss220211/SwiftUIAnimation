//
//  DestinationLifeCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct DestinationLifeCycle: View {
    
    @State private var isTapped: Bool = false
    @State private var isToggle: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("첫번째 뷰입니다.")
                    .onTapGesture {
                        isTapped.toggle()
                    }
                    .navigationDestination(isPresented: $isTapped) {
                        Text("다음뷰 입니다.")
                            .onAppear {
                                print("🍀 다음뷰의 onappear!")
                            }
                            .onDisappear {
                                print("🍀 다음뷰의 onDisappear!")
                            }
                    }
                
                Text("두번째 이동뷰")
                    .onTapGesture {
                        isToggle.toggle()
                    }
                    .navigationDestination(isPresented: $isToggle) {
                        Text("다음뷰 입니다.")
                            .onAppear {
                                print("🌕 세번째뷰의 onappear!")
                            }
                            .onDisappear {
                                print("🌕 세번째뷰의 onDisappear!")
                            }
                    }
            }
            .onAppear {
                print("🔥 첫번째뷰의 onappear!")
            }
            .onDisappear {
                print("🔥 첫번째뷰의 onDisappear!")
            }
        }
    }
}

#Preview {
    DestinationLifeCycle()
}
