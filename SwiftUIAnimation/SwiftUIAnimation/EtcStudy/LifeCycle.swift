//
//  LifeCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct LifeCycle: View {
    
    @State private var text: String = "안녕"
    
    private var platform: [Platform] = [
        .init(name: "Paper", imageName: "circle", color: .red),
        .init(name: "computer", imageName: "rectangle", color: .blue),
        .init(name: "pencil", imageName: "pencil", color: .yellow),
        .init(name: "heart", imageName: "heart", color: .pink)
    ]
    
    var body: some View {
        NavigationStack {
            Text(text)
                .font(.headline)
            List {
                ForEach(platform, id: \.name) { platform in
                    NavigationLink(value: platform) {
                        Label(platform.name, systemImage: platform.imageName)
                            .foregroundColor(platform.color)
                            .onAppear {
                                print("🍀 두번째화면 onappear!")
                            }
                            .onDisappear {
                                print("🍀 두번째화면 onDisappear!")
                            }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("리스트")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    VStack {
                        Image(systemName: platform.imageName)
                        Text(platform.name)
                    }.font(.largeTitle)
                }
            }
            // NavigationLink 와 NavigationDestination은 묶여서 사용되는 존재임
        }
        .task {
            // View가 생성되지 전에 비동기 함수가 실행되는 부분일 뿐 Onappear보다 먼저 실행된다고 보장할 수 없음
            
            print("🔥🔥 첫 번째화면 task 시작!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.text = "잘가"
            }
            print("🔥🔥 첫 번째화면 task 끝!")
        }
        .onAppear {
            print("🔥 첫 번째화면 onappear!")
        }
        .onDisappear {
            print("🔥첫 번째 화면 Disonappear")
        }
        .onChange(of: platform.self) { oldValue, newValue in
            print(oldValue)
            print(newValue)
        }
    }
}

#Preview {
    NavigationStack {
        LifeCycle()
    }
}


struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}
