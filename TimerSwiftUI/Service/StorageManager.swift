//
//  StorageManager.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("user") var userData: Data?
    
    private init() {}
    
    func fetchData() -> User {
        guard let user = userData else { return User() }
        return try? JSONDecoder().decode(User.self, from: user)
    }
    
    func saveUser(userName: String) {
        userData = try? JSONEncoder().encode(User(name: userName, isLoggedIn: true))
    }
    
    func deleteUser() {
        userData = nil
    }
}
