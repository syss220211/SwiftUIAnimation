//
//  AboutOffSet.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/27.
//

import SwiftUI

struct AboutOffSet: View {
    var body: some View {
        VStack {
            Text("OffSet")
                .background(.pink)
                .offset(x: 50, y: 50)
                .background(.purple)
//            
//            Text("Test1")
//                .frame(width: 100, height: 100)
//                .padding()
//                .background(.green)
//                .overlay {
//                    Text("Test2")
//                        .padding()
//                        .background(.blue)
//                        .offset(x: 0, y: 0)
//                }
//            
//            ZStack {
//                Text("About OffSet")
//                    .offset(.zero)
//                    .padding()
//                    .background(.red)
//                
//                Text("About OffSet")
//                    .padding()
//                    .background(.yellow)
//                    .offset(x: 10, y: 10)
//            }
        }
        .onAppear {
            print("\(UIScreen.main.bounds.width)")
            print("\(UIScreen.main.bounds.height)")
        }
    }
}

#Preview {
    AboutOffSet()
}
