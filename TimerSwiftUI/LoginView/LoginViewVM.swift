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
        self.user = User(name: storageManager.userName, isLoggedIn: !storageManager.userName.isEmpty)
    }
}
