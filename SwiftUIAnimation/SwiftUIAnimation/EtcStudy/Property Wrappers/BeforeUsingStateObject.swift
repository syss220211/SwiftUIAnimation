//
//  BeforeUsingStateObject.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/10.
//

import SwiftUI

/*
 getFruits, removeFruits => View를 그리는 것과 연관이 없는 로직
 View / Data 로직 분리를 위해 StateObject 사용하기
 */

// beforeusing stateobject의 viewmodel
class beforeStateObjectVM: ObservableObject { // 관찰 가능한 객체임을 명시하기 (using ObservableObject)
    @Published var fruitArray: [FruitModel] = []
    
    // View / Data 로직 분리를 위해 함수 가져오기
    func getFruits() {
        let fruit1 = FruitModel(name: "Peach", count: 12)
        let fruit2 = FruitModel(name: "Melon", count: 7)
        
        fruitArray.append(contentsOf: [fruit1, fruit2])
    }
    
    func removeFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct BeforeUsingStateObject: View {
    
    @State private var fruitArray: [FruitModel] = [
        FruitModel(name: "Orange", count: 1),
        FruitModel(name: "Banana", count: 4),
        FruitModel(name: "Watermelon", count: 12)
    ]
    
    // var viewModel: beforeStateObjectVM = beforeStateObjectVM()
    // 일반 변수 생성과 동일하기 때문에 화면을 구성할 수 없음
    // 데이터의 변화를 확인하고 뷰를 업데이트하기 위해서 프로퍼티 래퍼를 지정해야함 -> ObervedObject
    @ObservedObject var viewModel: beforeStateObjectVM = beforeStateObjectVM()
    // ObservedObject 하기 위해서는 객체가 관찰가능한 객체임을 명시해주어야 함 -> ObservableObject로 명시
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.fruitArray, id: \.self.id) { fruit in // fruitArray
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text("\(fruit.name)")
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: viewModel.removeFruit) //removeFruit
            }
            .navigationTitle("Fruit List")
            .listStyle(.plain)
            .onAppear {
                viewModel.getFruits() // getFruits()
            }
        }
    }
    
    /*
    func getFruits() {
        let fruit1 = FruitModel(name: "Peach", count: 12)
        let fruit2 = FruitModel(name: "Melon", count: 7)
        
        fruitArray.append(contentsOf: [fruit1, fruit2])
    }
    
    func removeFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    */
}

#Preview {
    BeforeUsingStateObject()
}
