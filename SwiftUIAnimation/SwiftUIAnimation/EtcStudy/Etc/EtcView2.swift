//
//  ETCView2.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/05.
//

import SwiftUI

struct EtcView2: View {
    private let type = ["동양화", "아크릴화", "ㅇㅇㅇ", "수묵화", "수묵화2"]
    private let colums: [GridItem] = [GridItem(.flexible(), spacing: 16),
                                      GridItem(.flexible(), spacing: 16),
                                      GridItem(.flexible(), spacing: 16)]
    
    
    var body: some View {
        ZStack {
            Image("test")
                .resizable()
                .ignoresSafeArea()
            
            ZStack {
                
                Image(systemName: "heart")
                    .background(Color.gray)
                    .font(.system(size: 200))
                    .padding(.bottom, 400)
                
                VStack(alignment: .leading, spacing: 50) {
                    Text("미술 취향을 선택해주세요")
                        .font(.system(size: 18, weight: .bold))
                    
                    LazyVGrid(columns: colums, spacing: 10, content: {
                        ForEach(type, id: \.self) { index in
                            Text(index)
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(Color.gray)
                                .foregroundStyle(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    })
                    
                    Spacer()
                    
                    NavigationLink {
                        BasicModifierStudy()
                    } label: {
                        Text("다음")
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color.gray)
                            .foregroundStyle(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .padding(.horizontal, 24)
        }
        
    }
}

#Preview {
    NavigationStack {
        EtcView2()
    }
}
