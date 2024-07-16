//
//  SheetTest.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/15.
//

import SwiftUI

struct TestValue: Identifiable {
    var id = UUID().uuidString
    var name: String
}

enum TestEnum: Identifiable {
    var id: Self { self }
    
    case test1
    case test2
}

struct SheetTest: View {
    @State var test: TestValue? = nil
    @State var enumTest: TestEnum? = nil
    
    var body: some View {
        VStack {
            Text("Ddd")
                .onTapGesture {
                    enumTest = .test1
//                    test = TestValue(name: "hi")
                }
            
        }
        .sheet(item: $enumTest) { value in
            Text("하이염")
            Text("돌아가기")
                .onTapGesture {
                    enumTest = nil
                }
        }
    }
}

#Preview {
    SheetTest()
}
