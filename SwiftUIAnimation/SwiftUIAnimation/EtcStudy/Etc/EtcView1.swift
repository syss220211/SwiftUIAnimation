//
//  EtcView1.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/05.
//

import SwiftUI

struct EtcView1: View {
    @State private var name: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("사용하실 닉네임을 설정해주세요")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 20)
                
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                
             
                VStack(spacing: 4) {
                    HStack(spacing: 16) {
                        TextField(text: $name) {
                            Text("닉네임 설정")
                        }
                        
                        Text("중복체크")
                            .onTapGesture {
                                print("ttt")
                            }
                            .padding(5)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        ForEach(0..<3) { i in
                            HStack(spacing: 5) {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12))
                                Text("조건\(i+1)")
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    NavigationLink {
                        EtcView2()
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
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    EtcView1()
}
