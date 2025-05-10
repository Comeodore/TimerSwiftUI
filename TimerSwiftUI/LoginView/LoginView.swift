//
//  LoginView.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

struct LoginView: View {
    private var storageManager = StorageManager.shared
    
    @Environment(LoginViewVM.self) var loginViewVM
    @State var user = User(name: "")
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                TextField("Type username...", text: $user.name)
                    .multilineTextAlignment(.center)
                
                Text(user.countNameCharacters.formatted())
                    .foregroundStyle(user.counterColor)
            }
            .padding()
            
            Button(action: saveUser) {
                Label("OK", systemImage: "checkmark.circle")
                    .foregroundStyle(user.countNameCharacters >= 3 ? .blue : .gray)
            }
            .disabled(user.countNameCharacters < 3)
        }
    }
    
    func saveUser() {
        loginViewVM.user = User(name: user.name, isLoggedIn: true)
        storageManager.saveUser(userName: user.name)
    }
}

#Preview {
    LoginView()
        .environment(LoginViewVM())
}
