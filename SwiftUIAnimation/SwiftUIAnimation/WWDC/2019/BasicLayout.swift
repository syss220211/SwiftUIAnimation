//
//  AboutLayout.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/27.
//

// https://developer.apple.com/videos/play/wwdc2019/237/?time=815
import SwiftUI

struct BasicLayout: View {
    var body: some View {
        HStack(alignment: .midStarAndTitle) { // 커스텀 정렬
            VStack {
                Text("✨✨✨✨✨")
                    .alignmentGuide(.midStarAndTitle, computeValue: { dimension in
                        dimension[.bottom] / 2
                    })
                Text("5 stars")
                    
            }.font(.caption)
                .background(.red)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Avocado Toast").font(.title)
                        .alignmentGuide(.midStarAndTitle, computeValue: { dimension in
                            dimension[.bottom] / 2
                        })
                    Spacer()
                    Image("_Avocado_20")
                }
                
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                    .font(.caption).lineLimit(1)
            }
            .background(.yellow)
        }
        .background(.green)
        
        HStack(alignment: .center) { // 뷰의 중간 정렬
            VStack {
                Text("✨✨✨✨✨")
                    .alignmentGuide(.bottom, computeValue: { dimension in
                        dimension[.bottom] / 2
                    })
                    
                Text("5 stars")
            }.font(.caption)
                .background(.red)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Avocado Toast").font(.title)
                        .alignmentGuide(.bottom, computeValue: { dimension in
                            dimension[.bottom] / 2
                        })
                    Spacer()
                    Image("_Avocado_20")
                }
                
                Text("Ingredients: Avocado, Almond Butter, Bread, Red Pepper Flakes")
                    .font(.caption).lineLimit(1)
            }
            .background(.yellow)
        }
        .background(.green)
        
        
        HStack {
            Text("Delicious").font(.caption)
            Image("_Avocado_20")
            Text("Acovado Toast")
        }
        
        HStack(alignment: .lastTextBaseline) {
            Text("Delicious").font(.caption)
            Image("_Avocado_20")
            Text("Acovado Toast")
        }
    }
}

#Preview {
    BasicLayout()
}


// 별과 제목의 정렬을 맞추는 방법
extension VerticalAlignment {
    private enum CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
    }
    
    static let midStarAndTitle = VerticalAlignment(CustomAlignment.self)
}
