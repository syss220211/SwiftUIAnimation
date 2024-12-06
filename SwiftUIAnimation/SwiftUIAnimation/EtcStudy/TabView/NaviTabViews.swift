//
//  TabView1.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/06/17.
//

import SwiftUI

struct TabView1: View {
    @EnvironmentObject var router: TabViewRouter
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Tabview1")
                Text("go to Tabview3")
                    .onTapGesture {
                        print("tab1")
                        router.navigateTo(.oneOne)
                    }
                
                NavigationLink("Go to Detail View (with Tab Bar)") {
                    DetailView2()
                }
            }
            .foregroundStyle(Color.white)
        }
    }
}

struct TabView2: View {
    @EnvironmentObject var router: TabViewRouter
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Tabview2")
                Text("GotoTabView2")
                    .onTapGesture {
                        print("tab2")
                        router.navigateTo(.twoTwo)
                    }
            }
        }
    }
}

struct TabView3: View {
    @EnvironmentObject var router: TabViewRouter
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                Text("oneOne")
                Text("Go to View5")
                    .onTapGesture {
                        print("view5 - twotwo")
                        router.replaceNavigationStack(.twoTwo)
                    }
            }
            .foregroundStyle(Color.white)
            .font(.largeTitle)
        }
    }
}

struct TabView4: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            Text("twoTwo")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
    }
}

struct TabView5: View {
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            Text("View5")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
    }
}

struct DetailView2: View {
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            Text("DetailView2")
                .font(.largeTitle)
                .foregroundStyle(Color.white)
        }
    }
}


#Preview {
    TabView3()
}
