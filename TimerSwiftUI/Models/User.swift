//
//  User.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import Observation
import SwiftUI

@Observable
final class User: Codable {
    var name: String
    var isLoggedIn: Bool
    
    init(name: String, isLoggedIn: Bool = false) {
        self.name = name
        self.isLoggedIn = isLoggedIn
    }
    
    var countNameCharacters: Int {
        return name.count
    }
    
    var counterColor: Color {
        return countNameCharacters >= 3 ? .green : .gray
    }
}
