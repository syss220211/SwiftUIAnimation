//
//  AccountStorageExample.swift
//  SwiftUIAnimation
//
//  Created by 박서연 on 2024/07/19.
//

import Foundation

final class AccountStorageExample {
    static var shared = AccountStorageExample()
    
    private init() {}
    
    var isGuest: Bool {
        return accessToken?.isEmpty ?? true
    }
    
    var accessToken: String? {
        get {
            guard let data = KeyChainExample.load(key: "accessToken"),
                  let token = String(data: data, encoding: .utf8) else {
                return nil
            }
            debugPrint("🔮 get accessToken : \(token)")
            return token
        }
        set {
            if let token = newValue, let data = token.data(using: .utf8) {
                KeyChainExample.save(key: "accessToken", data: data)
                debugPrint("🔮 save accessToken : \(token)")
            } else {
                KeyChainExample.delete(key: "accessToken")
                debugPrint("🔮 delete accessToken")
            }
        }
    }
    
    var refreshToken: String? {
        get {
            guard let data = KeyChainExample.load(key: "refreshToken"),
                  let token = String(data: data, encoding: .utf8) else {
                return nil
            }
            debugPrint("🔮 get refreshToken : \(token)")
            return token
        }
        set {
            if let token = newValue, let data = token.data(using: .utf8) {
                KeyChainExample.save(key: "refreshToken", data: data)
                debugPrint("🔮 save refreshToken : \(token)")
            } else {
                KeyChainExample.delete(key: "refreshToken")
                debugPrint("🔮 delete refreshToken")
            }
        }
    }
    
    func reset() {
        accessToken = nil
        refreshToken = nil
    }
}

//final class AccountStorageExample: ObservableObject {
//    static let shared = AccountStorageExample()
//
//    @Published var accessToken: String? {
//        didSet {
//            if let token = accessToken, let data = token.data(using: .utf8) {
//                KeyChainExample.save(key: "accessToken", data: data)
//                debugPrint("🔮 save accessToken : \(token)")
//            } else {
//                KeyChainExample.delete(key: "accessToken")
//                debugPrint("🔮 delete accessToken")
//            }
//        }
//    }
//
//    @Published var refreshToken: String? {
//        didSet {
//            if let token = refreshToken, let data = token.data(using: .utf8) {
//                KeyChainExample.save(key: "refreshToken", data: data)
//                debugPrint("🔮 save refreshToken : \(token)")
//            } else {
//                KeyChainExample.delete(key: "refreshToken")
//                debugPrint("🔮 delete refreshToken")
//            }
//        }
//    }
//
//    var isGuest: Bool {
//        return accessToken?.isEmpty ?? true
//    }
//
//    private init() {
//        self.accessToken = KeyChainExample.load(key: "accessToken").flatMap { String(data: $0, encoding: .utf8) }
//        self.refreshToken = KeyChainExample.load(key: "refreshToken").flatMap { String(data: $0, encoding: .utf8) }
//    }
//
//    func reset() {
//        accessToken = nil
//        refreshToken = nil
//    }
//}
