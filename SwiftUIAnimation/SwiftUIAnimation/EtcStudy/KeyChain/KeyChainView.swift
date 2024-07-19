//
//  KeyChainView.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/19.
//

import SwiftUI

class keychainModel: ObservableObject {
    func loginUser(_ accessToken: String) {
        AccountStorageExample.shared.accessToken = accessToken
        print("😈 Success LoginUser")
    }
    
    func logoutUser() {
        AccountStorageExample.shared.reset()
        print("😈 Success LogoutUser")
    }
}


struct KeyChainView: View {
//    @StateObject var accountStorage = AccountStorageExample.shared
    var accountStorage = AccountStorageExample.shared
    
    var body: some View {
        NavigationStack {
            if accountStorage.isGuest {
                GuestView()

                NavigationLink {
                    LoginView()
                } label: {
                    Text("로그인하러 가기")
                }

            } else {
                UserView()
            }
        }
    }
}

struct LoginView: View {
    @StateObject private var viewmodel = keychainModel()
    @State private var accessToken: String = ""
    @State private var refreshToken: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("accessToken", text: $accessToken)
                    .padding(10)
                    .background(Color.orange)

                Text("누르세용")
                    .padding(10)
                    .background(.gray)
                    .onTapGesture {
                        viewmodel.loginUser(accessToken)
                    }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct GuestView: View {
    var body: some View {
        VStack {
            Text("⛑️ Here is Guest View!")
        }
    }
}

struct UserView: View {
    @StateObject private var viewmodel = keychainModel()
    
    var body: some View {
        VStack {
            Text("✳️ Here is User View!")
            
            Text("Lets log out!")
                .onTapGesture {
                    viewmodel.logoutUser()
                }
        }
    }
}

#Preview {
    KeyChainView()
}
