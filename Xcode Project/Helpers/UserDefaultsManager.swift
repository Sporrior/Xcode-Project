//
//  UserDefaultsManager.swift
//  Atticus
//
//  Created by Damien Engelen on 26/01/2024.
//

import Foundation

struct UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {} // Private initializer for Singleton

    func saveUserName(_ name: String) {
        UserDefaults.standard.set(name, forKey: "userName")
    }

    func getUserName() -> String {
        UserDefaults.standard.string(forKey: "userName") ?? ""
    }

    func saveUserEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: "userEmail")
    }

    func getUserEmail() -> String {
        UserDefaults.standard.string(forKey: "userEmail") ?? ""
    }
}
