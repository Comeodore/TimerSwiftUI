//
//  LoginView.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(LoginViewVM.self) var loginViewVM
    @State var user = User(name: "")
    
    private var storageManager = StorageManager.shared
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                TextField("Type username...", text: $user.name)
                    .multilineTextAlignment(.center)
                
                Text(user.countNameCharacters.formatted())
                    .foregroundStyle(user.counterColor)
            }
            .padding()
            Button {
                loginViewVM.login(userName: user.name)
            } label: {
                Label("OK", systemImage: "checkmark.circle")
                    .foregroundStyle(user.countNameCharacters >= 3 ? .blue : .gray)
            }
            .disabled(user.countNameCharacters < 3)
        }
    }
}

#Preview {
    LoginView()
        .environment(LoginViewVM())
}
