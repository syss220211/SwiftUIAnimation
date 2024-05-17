//
//  ZStackModifier.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/17.
//

import SwiftUI

struct ZStackModifier: View {
    
    @State private var showing = false
    
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
                Text("안녕")
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color.pink.opacity(0.5))
                    .padding(.bottom, 30)
                    .onTapGesture {
                        showing = true
                    }
            }
            .padding(.horizontal, 20)
        }
//        .contentOverlayZstackModifier(showing: $showing)
        .contentInZStackModifier(showing: $showing)

            
    }
}


struct ContentOverlayView: ViewModifier {
    @Binding var showing: Bool
    
    func body(content: Content) -> some View {
        content
        // overlay로 한다는 것 = 뷰의 크기만큼의 위에서 popup이기 때문에 뷰 사이즈가 작으면 해당 부분만 덮게됨
            .overlay {
                ZStack {
                    Color.black
                        .opacity(0.3)
                        .ignoresSafeArea()
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: .infinity, height: 160)
                        .overlay {
                            VStack(spacing: 30) {
                                Text("커스텀 팝업 질문??")
                                
                                HStack(spacing: 20) {
                                    Text("확인")
                                        .popupButtonModifier(color: .orange)
                                        .onTapGesture {
                                            showing = false
                                        }
                                    Text("취소")
                                        .popupButtonModifier(color: .pink)
                                        .onTapGesture {
                                            showing = false
                                        }
                                }
                                .padding(.horizontal, 30)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal, 50)
                }
                .opacity(showing ? 1 : 0)
            }
            
    }
}

struct ZStackContentView: ViewModifier {
    
    @Binding var showing: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            Color.black
                .opacity(0.3)
                .ignoresSafeArea()
                .opacity(showing ? 1 : 0)
            
            content
            
            Rectangle()
                .fill(.white)
                .frame(width: .infinity, height: 160)
                .overlay {
                    VStack(spacing: 30) {
                        Text("커스텀 팝업 질문??")
                        
                        HStack(spacing: 20) {
                            Text("확인")
                                .popupButtonModifier(color: .orange)
                                .onTapGesture {
                                    showing = false
                                }
                                
                            Text("취소")
                                .frame(maxWidth: .infinity)
                                .popupButtonModifier(color: .pink)
                                .onTapGesture {
                                    showing = false
                                }
                        }
                        .padding(.horizontal, 30)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .padding(.horizontal, 50)
                .opacity(showing ? 1 : 0)
        }
    }
}

extension View {
    func contentOverlayZstackModifier(showing: Binding<Bool>) -> some View {
        self.modifier(ContentOverlayView(showing: showing))
    }
    
    func contentInZStackModifier(showing: Binding<Bool>) -> some View {
        self.modifier(ZStackContentView(showing: showing))
    }
    
    func popupButtonModifier(color: Color) -> some View {
        self
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ZStackModifier()
}
