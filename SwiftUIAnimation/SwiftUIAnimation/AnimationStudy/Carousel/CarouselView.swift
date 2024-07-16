//
//  CarouselThirdView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/17.
//

import SwiftUI

class WidthThird: ObservableObject {
    @Published var width: CGFloat = 0
}

// 바깥에서 한번에 padding을 주고 싶을때
public struct CarouselView<Data: Identifiable, Content: View>: View {
    
    @Binding var width: CGFloat
    public let data: [Data]
    public let edgeSpacing: CGFloat
    public let contentSpacing: CGFloat
    public let totalSpacing: CGFloat
    public let contentHeight: CGFloat
    public let carouselContent: (Data) -> Content
    
    @State public var currentIndex: CGFloat = 0
    @State public var currentOffset: CGFloat = 0
    
    public init(
        width: Binding<CGFloat>,
        data: [Data],
        edgeSpacing: CGFloat,
        contentSpacing: CGFloat,
        totalSpacing: CGFloat,
        contentHeight: CGFloat,
        @ViewBuilder carouselContent: @escaping (Data) -> Content
    ) {
        self._width = width
        self.data = data
        self.edgeSpacing = edgeSpacing
        self.contentSpacing = contentSpacing
        self.totalSpacing = totalSpacing
        self.contentHeight = contentHeight
        self.carouselContent = carouselContent
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                let baseOffset = contentSpacing + edgeSpacing - totalSpacing
                let total: CGFloat = geometry.size.width + totalSpacing * 2
                
                let contentWidth = total - (edgeSpacing * 2) - (2 * contentSpacing)
                let nextOffset = contentWidth + contentSpacing
                
                HStack(spacing: contentSpacing) {
                    ForEach(0..<data.count, id: \.self) { index in
                        carouselContent(data[index])
                            .frame(width: contentWidth, height: contentHeight)
                            .gesture(
                                DragGesture()
                                    .onEnded { value in
                                        let offsetX = value.translation.width
                                        
                                        if offsetX < -50 { // 오른쪽으로 스와이프
                                            currentIndex = min(currentIndex + 1, CGFloat(data.count - 1))
                                        } else if offsetX > 50 { // 왼쪽으로 스와이프
                                            currentIndex = max(currentIndex - 1, 0)
                                        }
                                         
                                        withAnimation {
                                            currentOffset = -currentIndex * nextOffset
                                        }
                                    }
                            )
                    }
                }
                .offset(x: currentOffset + (currentIndex > 0 ? baseOffset : 0))
                .onAppear {
                    width = contentWidth
                }
            }
        }
    }
}

struct CarouselThirdExample: View {
    @StateObject var vm = WidthThird()
    
    var body: some View {
        VStack {
            CarouselView(width: $vm.width,
                         data: CarouselType.data,
                         edgeSpacing: 30,
                         contentSpacing: 20,
                         totalSpacing: 30,
                         contentHeight: 200) 
            { content in
                Rectangle()
                    .fill(content.color)
                    .overlay {
                        Text(content.content)
                    }
            }
            .frame(height: 200)
            .padding(.horizontal, 30) // 더 해주는 여백의 크기만큼 geometry에 + 해주면 됨!!!!
            .overlay {
                VStack {
                    Rectangle()
                        .fill(.gray)
                        .padding(.horizontal, 50)
                        .frame(height: 50)
                        .overlay { Text("두번째부터") }
                    
                    Rectangle()
                        .fill(.purple)
                        .padding(.horizontal, 30)
                        .frame(height: 50)
                        .overlay { Text("edge는 여기 바깥") }
                    
                }
            }
        }
    }
}

#Preview {
    CarouselThirdExample()
}
