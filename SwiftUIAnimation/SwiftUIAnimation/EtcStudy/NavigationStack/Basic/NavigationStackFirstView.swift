//
//  NavigationStackFirstView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/07.
//

import SwiftUI

struct NavigationStackFirstView: View {
    var body: some View {
        NavigationStack {
            
            // navigationLink (titleKey: destination:)
            NavigationLink("Go to SecondView") {
                NavigationStackSecondView()
            }
            
            // navigationLink (destination: label:)
            NavigationLink {
                NavigationStackSecondView()
            } label: {
                HStack {
                    Image(systemName: "heart")
                    Text("Go to second with label-dest")
                }
                .foregroundStyle(Color.white)
                .padding(10)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            // navigationLink (titleKey: value:)
            // Go to second-keyvalue를 Int 타입의 벨류 타입을 가지는 뷰로 만들었음
            // 목적지가 int 타입을 가지는 뷰라면 영향을 받도록 설정함
            NavigationLink("Go to IntegerView with key-value", value: 99)
                .navigationDestination(for: Int.self) { value in
                    NavigationStackIntegerView(value: value)
                    // 현재 값을 이어서 받아서 사용하고 싶은 경우, link-destination으로 사용
                }
            
            // navigationLink(vale: label:)
            // titleKey-value 와 동일하지만, titlekey 를 커스텀할 수 있느
            NavigationLink(value: "String Type") {
                Text("Go to StringView with value-label")
                    .foregroundStyle(Color.white)
                    .padding(10)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .navigationDestination(for: String.self) { value in
                NavigationStackStringTypeView(value: value)
            }
        }
    }
}

struct NavigationStackStringTypeView: View {
    
    let value: String
    
    var body: some View {
        Text("Here is \(value) View")
    }
}

struct NavigationStackIntegerView: View {
    let value: Int
    
    var body: some View {
        Text("Int Type Value :\(value)")
    }
}

#Preview {
    NavigationStackFirstView()
}
