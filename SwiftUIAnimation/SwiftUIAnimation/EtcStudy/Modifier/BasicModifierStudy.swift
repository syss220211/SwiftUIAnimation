//
//  ZStackModifier.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/05/17.
//

import SwiftUI

struct BasicModifierStudy: View {
    var body: some View {
        ScrollView {
            Text("Make Modifier Example")
                .padding(30)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Modifier 그 자체")
                .modifier(StudyModifier(radius: 30, color: .red))
            
            Text("Extension View")
                .studyMakeModifier(radius: 40, color: .green)
        }
        .makeSampleBackButton()
        .makeSampleNavigation(text: "Sample Title")
        .makeSampleCustomNavigationTitle(text: "Title Test")
    }
}

struct StudyModifier: ViewModifier {
    let radius: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

extension View {
    func studyMakeModifier(radius: CGFloat, color: Color) -> some View {
        modifier(StudyModifier(radius: radius, color: color))
    }
    
    func makeSampleBackButton() -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("heart tapped!!!!")
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(Color.pink)
                    }
                }
            }
    }
    
    func makeSampleCustomNavigationTitle(text: String) -> some View {
        VStack {
            Text(text)
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(Color.purple)
            
            self
            
            Spacer()
        }
    }
    
    func makeSampleNavigation(text: String) -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                   Text(text)
                        .font(.system(size: 30, weight: .bold, design: .serif))
                        .foregroundStyle(Color.purple)
                }
            }
    }
}

#Preview {
    NavigationStack {
        BasicModifierStudy()
    }
}
