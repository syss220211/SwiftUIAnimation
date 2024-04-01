//
//  AboutOffSet.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/27.
//

import SwiftUI

struct AboutOffSet: View {
    var body: some View {
        VStack {
            Text("OffSet")
                .background(.pink)
                .offset(x: 50, y: 50)
                .background(.purple)
            
            /* offSet의 레이아웃 프로세스
             offset: offset 매개변수에 지정된 수평 및 수직 양만큼 이 뷰를 오프셋(계산)합니다.
             1. RootView -> background(pink) -> offset -> background(purple) -> Text
             2. RootView -> background, offset, background(중립) -> Text) Text: 나는 내 글자 길이만큼 필요해
             3. Text의 bounds에 맞춰서 background(purple)의 bounds 설정됨
             4. offset! ) offset도 레이아웃 중립이기 때문에 똑같은 bounds의 값을 가지며, offset이 적용됐다 하더라도 원래의 dimensions은 유지됨
                그 상태에서, 자신의 좌표공간 내에서 offset 만큼 계산하여 배치함 (bounds 사용 != 배치)
             5. The original dimensions of the view aren’t changed by offsetting the contents;
             6. offset bounds -> backgound(pink) bounds, 중립이기 때문에 해당 bounds 만큼을 사용
             7. RootView한테 결정된 bounds 보고하면 RootView가 배치
             -> offset은 기본 geometry를 변경하지 않고 실제 뷰를 렌더링해야하는 위치를 변경한다.
             */
            
            Text("Offset2")
                .background(.yellow)
                .offset(x: 100, y: 100)
            
            /* offset2의 레이아웃 프로세스
             1. RootView -> background(yellow) -> offset
             2. RootView -> background(yellow)(중립) -> offset -> text) text: 자신의 길이만큼 필요하다고 반환
             3. text bounds == offset bounds, 이면서 동시에 offset은 x:100, y:100에 text를 "위치"시킴
             4. offset bounds == background(.yellow) bounds 이면서 동일하게 자신의 뷰에 위치시킴
             5. background(yellow) bounds -> RootView bounds
             */
        }
    }
}

struct CheckingBetween: View {
    var body: some View {
        ZStack {
            Text("CheckingBetween")
                .background(.green)
                .offset(x: 100, y: 100)
                .background(.yellow)
                .frame(width: 200, height: 200, alignment: .bottomTrailing)
                .background(.red)
            Text("0, 0")
                .background(.blue)
                .offset(x: 0, y: 0)
        }
        
        /*
         RootView -> background(yellow) -> offset -> background(green) -> text
         1. Text 자신의 길이만큼 사용하겠다고 background(green)에게 반환, background는 자신의 중앙에 위치
         2. background(green) -> offset) offset: 해당 bounds의 만큼을 100, 100에 배치함
         3. "나 해당 bounds만큼 필요하고 100*100에 배치했어" 라고 background(yellow)에게 반환함
         4. offset bounds == background(yellow) bounds 가 되고, background(yellow)는 본인 기준 중앙에 배치함
         *yellow의 레이아웃 결정은?: backgound가 yellow한테 나 bounds는 가지고 있는 중립인데 너 어디에 표시될래? -> yellow:나 중립이니까 너위치 그대로 가져갈게
         5. background(yellow)는 중간에 offset(~text) 배치
         5. background(yellow) -> RootView, RootView는 자식뷰를 따름
         
         
         
         1. RootView -> background(red) -> frame -> background(yellow) -> offset -> background(green) -> Text
         2. Text: 나 내 문자 길이만큼 쓸게 -> background(green) 반환
         3. Text bounds == background bounds, background(green)은 green(중립)에게 물어보고 반환을 받은 뒤 해당 bounds를 자신의 뷰 중앙에 배치
         4. background bounds -> offset) background(green) bounds == offset bounds, offset은 100, 100에 레이아웃 배치함
         5. offset bounds -> background(yellow)) background(yellow)는 해당 bounds만큼 사용하면서 자신의 뷰 중앙에 배치
         6. background(yellow) -> frame) frame은 200, 200 만큼 필요하고(bounds), 자식들은 bottomTrailing에 배치한다고 반환
         * 5 -> 6 부분으로 인해서 yellow 와 text+green이 bottomTrailing 쪽으로 200, 200만큼 이동하게 됨
         7. frame -> background(red)) frame bounds == background(red) bounds, background(red)는 본인 뷰의 중앙에 배치함
         8. background(red) -> RootView) RootView: 자식 뷰의 결정에 따름
         */
    }
}

#Preview {
//    AboutOffSet()
    CheckingBetween()
}
