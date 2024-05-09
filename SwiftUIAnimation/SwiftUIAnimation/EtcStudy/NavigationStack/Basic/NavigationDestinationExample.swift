//
//  NavigationDestinationExample.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/07.
//

import SwiftUI

struct Person: Hashable {
    let name: String
    let age: Int
}

struct NavigationDestinationExample: View {
    
    let people = [
        Person(name: "Linda", age: 24),
        Person(name: "Hyeon", age: 26),
        Person(name: "Jade", age: 25),
        Person(name: "Looter", age: 28)
    ]
    
    var body: some View {
        NavigationStack {
            List(people, id: \.self) { person in
                NavigationLink(value: person) {
                    HStack {
                        Text(person.name)
                            .bold()
                            .foregroundStyle(Color.pink)
                        Text("\(person.age)")
                    }
                }
            }
            .navigationDestination(for: Person.self) { value in
                NavigationStackPersonView(person: value)
            }
            .listStyle(.plain)
        }
    }
}

struct NavigationStackPersonView: View {
    
    let person: Person
    
    var body: some View {
        Text("\(person.name)는 \(person.age)살 입니다.")
    }
}

struct AnotherPersonView: View {
    let person: Person
    
    var body: some View {
        Text("Another Person View: \(person.name)은 \(person.age)살 입니다.")
    }
}

#Preview {
    NavigationDestinationExample()
}
