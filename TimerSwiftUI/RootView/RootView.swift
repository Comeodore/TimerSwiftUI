//
//  RootView.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

struct RootView: View {
    @Environment(LoginViewVM.self) var loginViewVM
    
    var body: some View {        
        if loginViewVM.user.isLoggedIn {
            TimerView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environment(LoginViewVM())
}
