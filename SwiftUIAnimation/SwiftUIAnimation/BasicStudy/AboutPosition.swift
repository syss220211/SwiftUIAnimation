//
//  AboutPosition.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/03/28.
//

import SwiftUI

struct AboutPosition: View {
    var body: some View {
        VStack {
            Text("Position")
                .background(.green)
                .position(x: 100, y: 100)
                .background(.blue)
                
            
            // Position: 이 뷰의 중심을 부모 좌표 공간의 지정된 지점에 배치함
            /* Position의 레이아웃 프로세스
             1. RootView -> background(blue) -> position -> background(green) -> Text
             2. background(중립) -> Position(사용 가능한 space를 모두 사용하는 View) -> Position은 모든 영역을 다 사용한다고 선언
             3. position -> background(green)(중립) -> Text) Text: 본인 길이만큼 사용한다고 반환
             4. Text bounds == background(green) bounds
             5. Position은 사용 가능한 모든 영역을 사용하면서, 지정된 공간에(x:100, y:100에) backgrounds(green) + Text를 배치시킴
             6. Position bounds -> background(blue) bounds 가 되면서 backgrounds는 blue가 됨
             7. background(blue) -> RootView (이미 position을 통해서 좌표값이 픽스가 되었기 때문에 각 레이아웃 계층에서 자식 뷰를  중간에 배치하더라도 고정된 값에 올려진것을 중간에 계속 중복적으로 올리는 것을 의미함. 즉 똑같이 올라감!)
             */
        }
    }
}

struct AboutPosition2: View {
    var body: some View {
        VStack {
            Text("Position")
                .background(.green)
                .position(x: 100, y: 100)
//                .background(.blue, ignoresSafeAreaEdges: [])
                .background(.blue)
                .position(x: 200, y: 200)
//                .background(.red)
                .background(.red, ignoresSafeAreaEdges: [])
                
            
            // Position: 이 뷰의 중심을 부모 좌표 공간의 지정된 지점에 배치함
            /* Position의 레이아웃 프로세스
             1. RootView -> background(red) -> position -> background(blue) -> position -> background(green) -> Text
             2. Text: 나 내 길이만큼 bounds 쓸게
                Text 길이 == Text bounds
                Text bounds > background(green)
             3. Text bounds == background(green) bounds
                background(green)는 해당 bounds를 가지고 본인 뷰의 중앙에 뷰 배치
             4. background(green) > position
                position은 전체공간을 사용할 수 있는 뷰 (bounds == 전체공간)
                bounds를 전체공간으로 가져가면서 지금까지의 background(green)을 200, 200에 배치함
             5. position > background(blue)
                position bounds == background(blue) bounds
                background(blue)는 해당 뷰를 본인의 뷰 중앙에 배치
             6. background(blue) > position
                background(blue) bounds == position bounds
                position은 전체 공간을 사용하면서 100, 100에 해당 뷰를 배치함
             7. position > background(red)
                position bound == background(red)
                background(red)는 본인뷰의 중앙에 자식뷰 배치
             8. background(red) > RootView
                RootView는 자식뷰의 레이아웃에 따름
             */
        }
    }
}


#Preview {
//    AboutPosition()
    AboutPosition2()
}
