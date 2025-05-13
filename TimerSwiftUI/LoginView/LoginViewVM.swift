//
//  LoginViewVM.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import Observation

@Observable
final class LoginViewVM {
    let storageManager = StorageManager.shared
    var user: User
    
    init() {
        self.user = StorageManager.shared.fetchData()
    }
    
    func login(userName: String) {
        user = User(name: userName, isLoggedIn: true)
        storageManager.saveUser(userName: userName)
    }
    
    func logout() {
        user.isLoggedIn = false
        storageManager.deleteUser()
    }
}
