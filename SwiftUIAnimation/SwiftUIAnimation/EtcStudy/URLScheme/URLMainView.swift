//
//  URLMainView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/09/05.
//

import SwiftUI

struct URLMainView: View {
    var body: some View {
        VStack {
            Button(action: openKakaoChannel) {
                Text("문의하기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    private func openKakaoChannel() {
        guard let url = URL(string: "http://pf.kakao.com/_VZuaxd") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    URLMainView()
}
