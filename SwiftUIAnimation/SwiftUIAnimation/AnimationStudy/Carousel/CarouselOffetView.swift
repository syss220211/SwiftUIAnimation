//
//  CarouselView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/15.
//

import SwiftUI

class WidthOb: ObservableObject {
    @Published var width: CGFloat = 0
}

public struct CarouselOffetView<Data: Identifiable, Content: View>: View {
    
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
                let size = geometry.size
                let contentWidth = size.width - (edgeSpacing * 2) - (2 * contentSpacing)
                let nextOffset = contentWidth - edgeSpacing
                let secondOffset = contentWidth + contentSpacing
                
                HStack(spacing: contentSpacing) {
                    ForEach(0..<data.count, id: \.self) { index in
                        carouselContent(data[index])
                            .frame(width: contentWidth, height: contentHeight)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        
                                    }
                                    .onEnded { value in
                                        let offsetX = value.translation.width
                                        
                                        if offsetX < -50 { // 오른쪽으로 스와이프
                                            currentIndex = min(currentIndex + 1, CGFloat(data.count - 1))
                                        } else if offsetX > 50 { // 왼쪽으로 스와이프
                                            currentIndex = max(currentIndex - 1, 0)
                                        }
                                        
                                        withAnimation {
                                            currentOffset = (currentIndex == 1 
                                                             ? -nextOffset
                                                             : (-nextOffset + -(secondOffset * (currentIndex - 1))))
                                        }
                                    }
                            )
                    }
                }
                .offset(x: currentIndex == 0 ? totalSpacing : currentOffset)
                .onAppear {
                    width = contentWidth
                }
            }
        }
    }
}

struct CarouselExample: View {
    @StateObject var vm = WidthOb()
    
    var body: some View {
        VStack {
            CarouselOffetView(width: $vm.width,
                         data: CarouselType.data,
                         edgeSpacing: 24,
                         contentSpacing: 14,
                         totalSpacing: 22,
                         contentHeight: 200) { content in
                Rectangle()
                    .fill(content.color)
                    .overlay {
                        Text(content.content)
                    }
                
            }.frame(height: 200)
                .overlay {
                    VStack {
                        Rectangle()
                            .fill(.gray)
                            .padding(.horizontal, 38)
                            .frame(height: 50)
                            .overlay { Text("두번째부터") }
                        
                        Rectangle()
                            .fill(.purple)
                            .padding(.horizontal, 24)
                            .frame(height: 50)
                            .overlay { Text("edge는 여기 바깥") }
                        
                        Rectangle()
                            .fill(.black)
                            .frame(width: vm.width)
                            .frame(height: 30)
                    }
                }
        }
    }
}

#Preview {
    CarouselExample()
}
