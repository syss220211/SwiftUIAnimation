//
//  AppleTabview.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/10/31.
//

import SwiftUI

struct AppleTabview: View {
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // 텍스트 크기와 스타일을 포함한 속성 설정
        let systemFontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12.0) // 원하는 글씨 크기로 설정
        ]
        
        // 선택된 탭과 선택되지 않은 탭 모두에 폰트 속성 적용
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = systemFontAttributes.merging(
            [.foregroundColor: UIColor.green]) { _, new in new }
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = systemFontAttributes.merging(
            [.foregroundColor: UIColor.blue]) { _, new in new }
        
        // 기타 속성 설정
        appearance.stackedLayoutAppearance.selected.iconColor = .green // 선택된 아이콘 색상
        appearance.stackedLayoutAppearance.normal.iconColor = .blue // 선택되지 않은 아이콘 색상
        
        let inset: CGFloat = 5
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: inset)
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: inset)
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    
    var body: some View {
        TabView(selection: $selectedTab) {
            AppleHomeView()
                .tabItem {
                    Label("홈", image: "testtab")
                }
                .tag(0)
            
            AppleSearchView()
                .tabItem {
//                    Label("Search", systemImage: "magnifyingglass")
                    VStack(spacing: 10) {
                        Image(uiImage: resizeImage(UIImage(systemName: "magnifyingglass")!, targetSize: CGSize(width: 24, height: 34))!)
                        Text("마이페이지")
                    }
                }
                .tag(1)
            
            AppleProfileView()
                .tabItem {
//                    Label("Profile", systemImage: "person")
                    VStack(spacing: 10) {
                        Image(uiImage: resizeImage(UIImage(named: "ic_mypage_empty")!, targetSize: CGSize(width: 24, height: 34))!)
                        Text("마이페이지")
                            .fontWeight(.bold)
                    }
                }
                .tag(2)
        }
        
    }
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let ratio = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        let yOffset = (targetSize.height - newSize.height)
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let newImage = renderer.image { context in
          context.cgContext.setFillColor(UIColor.clear.cgColor)
          context.cgContext.fill(CGRect(origin: .zero, size: targetSize))
          image.draw(in: CGRect(x: 0, y: yOffset, width: newSize.width, height: newSize.height))
        }
        
        return newImage
      }
}

extension UITabBarController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == "TabBarShadow" }) {
            shadowView.frame = tabBar.frame
        } else {
            let shadowView = UIView(frame: .zero)
            shadowView.frame = tabBar.frame
            shadowView.accessibilityIdentifier = "TabBarShadow"
            shadowView.backgroundColor = UIColor.white
            shadowView.layer.shadowColor = Color.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
            shadowView.layer.shadowOpacity = 0.1
            shadowView.layer.shadowRadius = 8
            view.addSubview(shadowView)
            view.bringSubviewToFront(tabBar)
        }
    }
}

struct AppleHomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "house")
        }
    }
}

struct AppleSearchView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
        }
    }
}

struct AppleProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
        }
    }
}

#Preview {
    AppleTabview()
}
