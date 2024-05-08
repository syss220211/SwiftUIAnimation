//
//  NavigationStackBinding.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/08.
//

import SwiftUI

struct NavigationStackBinding: View {
    @State private var bindingItem: Int?
    @State private var bindingBool: Bool = false
    
    var body: some View {
        NavigationStack {
            Button("item + 1") {
                bindingItem = .init(1)
            }
            .navigationDestination(item: $bindingItem) { value in
                NavigationStackBindingTest(bindingItem: value)
            }
            
            Button("make true") {
                bindingBool.toggle()
            }
            .navigationDestination(isPresented: $bindingBool) {
                Text("Second Page isPresnted")
                NavigationStackBindingBool(bindingBool: bindingBool)
            }
        }
    }
}

struct NavigationStackBindingTest: View {
    let bindingItem: Int
    
    init(bindingItem: Int) {
        self.bindingItem = bindingItem
        print("Binding Item View init 완료")
    }
    
    var body: some View {
        Text("\(bindingItem)")
    }
}

struct NavigationStackBindingBool: View {
    let bindingBool: Bool
    
    init(bindingBool: Bool) {
        self.bindingBool = bindingBool
        print("Binding Bool View init 완료")
    }
    
    var body: some View {
        Text("이동!")
    }
}


#Preview {
    NavigationStackBinding()
}
