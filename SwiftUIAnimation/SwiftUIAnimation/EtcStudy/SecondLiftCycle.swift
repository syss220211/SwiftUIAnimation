//
//  SecondLiftCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct SecondLiftCycle: View {
    @State private var changetext = "안녕"
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("첫번째 화면입니다.")
                Text(changetext)
                
                NavigationLink {
                    SecondLifeCycleSubView()
                        .onAppear {
                            print("🍀 두번째 화면의 Onappear!")
                        }
                        .onDisappear {
                            print("🍀 두번째 화면의 onDisappear!")
                        }
                } label: {
                    Text("다음뷰로 이동하기")
                }
                
                NavigationLink {
                    TwiceLifeCycleSubView()
                        .onAppear {
                            print("🚸 세번째 화면의 Onappear!")
                        }
                        .onDisappear {
                            print("🚸 세번째 화면의 onDisappear!")
                        }
                } label: {
                    Text("다다음뷰로 이동하기")
                }

            }
            .onAppear {
                print("🔥 첫번째 화면의 Onappear!")
            }
            .task {
                print("🔥🔥 첫번째 화면의 task start!")
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.changetext = "잘가"
                }
                print("🔥🔥 첫번째 화면의 task end!")
            }
            .onDisappear {
                print("🔥 첫번째 화면의 onDisappear!")
            }
        }
        
    }
}

#Preview {
    SecondLiftCycle()
}

struct SecondLifeCycleSubView: View {
    var body: some View {
        Text("이동한 뷰")
    }
}

struct TwiceLifeCycleSubView: View {
    var body: some View {
        Text("twice 뷰")
    }
}
