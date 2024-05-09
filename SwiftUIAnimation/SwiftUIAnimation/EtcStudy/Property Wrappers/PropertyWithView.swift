//
//  PropertyWithViewModel.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/04/19.
//

import SwiftUI

// https://www.youtube.com/watch?v=-yjKAb0Pj60
struct FruitModel {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class PropertyWithViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 4)
        let fruit3 = FruitModel(name: "Watermelon", count: 12)
        
        fruitArray.append(contentsOf: [fruit1, fruit2, fruit3])
    }
    
    func deleteFruits(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
    }
}

struct PropertyWithView: View {
//    @State private var fruitArray: [FruitModel] = []
    @ObservedObject var propertyViewModel: PropertyWithViewModel = PropertyWithViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(propertyViewModel.fruitArray, id: \.self.id) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text("\(fruit.name)")
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: propertyViewModel.deleteFruits)
//                .onDelete(perform: { indexSet in
//                    deleteFruits(indexSet: indexSet )
//                })
            }
            .onAppear {
                propertyViewModel.getFruits()
            }
            .navigationTitle("Fruit List")
            .listStyle(.plain)
        }
    }
    
}

#Preview {
    PropertyWithView()
}
