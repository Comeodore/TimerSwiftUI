//
//  StorageManager.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("userName") var userName = ""
    @AppStorage("userLoggedIn") var userLoggedIn = false
    
    private init() {}
    
    func saveUser(userName: String) {
        self.userName = userName
        self.userLoggedIn = true
    }
    
    func deleteUser() {
        self.userName = ""
        self.userLoggedIn = false
    }
}
