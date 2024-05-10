//
//  AboutStateObject.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/10.
//

import SwiftUI

struct FruitModel {
    let id = UUID().uuidString
    let name: String
    let count: Int
}

class AboutStateObjectViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    
    init() {
        getFruits()
    }
    
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

struct AboutStateObject: View {
//    @ObservedObject var viewModel: AboutStateObjectViewModel = AboutStateObjectViewModel()
    @StateObject private var viewModel: AboutStateObjectViewModel = AboutStateObjectViewModel()
    // 뷰가 다시 로드되는 경우를 제외하고는 관찰 가능한 객체와 동일히지만 렌더링해도 데이터를 유지하기 때문에 새로고침되지 않음
    // 기본적인 데이어터는 뷰를 업데이트할 때 실제로 변경되지 않기 때문에 StateObject를 사용하는것이 올바름
    // 즉 생성 또는 처음 호출할 때 StateObject로 생성하며, 생성된 객체를 사용하는 다른 뷰에서는 ObservedObject를 사용하는 것이 바람직함
    
    // @StateObject : use this on creation / init
    // @ObservedObject : use this for subviews
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.fruitArray, id: \.self.id) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text("\(fruit.name)")
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: viewModel.deleteFruits)
            }
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing: NavigationLink{
              SecondAboutStateObjectView(viewModel: viewModel)
            } label: {
                Image(systemName: "arrow.right")
            })
            .listStyle(.plain)
            
            NavigationLink("GO TO THIRD VIEW") {
                ThirdAboutStateObjectView()
            }
        }
    }
}

struct SecondAboutStateObjectView: View {
    @ObservedObject var viewModel: AboutStateObjectViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Button("go back") {
                    dismiss()
                }
                
                List {
                    ForEach(viewModel.fruitArray, id: \.self.id) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text("\(fruit.name)")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: viewModel.deleteFruits)
                    // 동일한 viewmodel을 이어받기 때문에 두번째뷰에서 데이터를 삭제하면 첫번째 뷰에서도 데이터가 삭제됨
                    .listStyle(.plain)
                }
            }

        }
    }
}

struct ThirdAboutStateObjectView: View {
    @ObservedObject var viewModel = AboutStateObjectViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Button("go back") {
                    dismiss()
                }
                
                List {
                    ForEach(viewModel.fruitArray, id: \.self.id) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text("\(fruit.name)")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: viewModel.deleteFruits)
                    // 동일한 viewmodel가 아니기 때문에 두번째에서 삭제해도 첫번째뷰에서 삭제 안됨
                    // 완전히 다른 객체를 생성하는 것
                    .listStyle(.plain)
                }
            }

        }
    }
}

#Preview {
    AboutStateObject()
}

