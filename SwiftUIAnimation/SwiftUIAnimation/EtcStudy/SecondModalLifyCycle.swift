//
//  SecondModalLifyCycle.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/18.
//

import SwiftUI

struct SecondModalLifyCycle: View {

    private var platform: [Platform] = [
        .init(name: "Paper", imageName: "circle", color: .red),
        .init(name: "computer", imageName: "rectangle", color: .blue),
        .init(name: "pencil", imageName: "pencil", color: .yellow),
        .init(name: "heart", imageName: "heart", color: .pink)
    ]
    
    var body: some View {
        NavigationStack {
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
        }
    }
}

#Preview {
    SecondModalLifyCycle()
}
