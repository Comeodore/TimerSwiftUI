//
//  TimerView.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

struct TimerView: View {
    private var storageManager = StorageManager.shared
    
    @Environment(TimerViewVM.self) var timerViewVM
    @Environment(LoginViewVM.self) var loginViewVM
    
    var body: some View {
        VStack {
            TextView(text: "Hi, \(loginViewVM.user.name)!")
                .padding(.top, 100)
            
            TextView(text: timerViewVM.counter.formatted())
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(text: timerViewVM.buttonText, color: .red, action: timerViewVM.timerButtonPressed)
                .padding(.bottom, 200)
            
            Spacer()
            
            ButtonView(text: "Log out", color: .blue, action: logout)
        }
    }
    
    func logout() {
        loginViewVM.user.isLoggedIn = false
        storageManager.deleteUser()
    }
}

#Preview {
    TimerView()
        .environment(TimerViewVM())
        .environment(LoginViewVM())
}

struct TextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
    }
}

struct ButtonView: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
                .frame(width: 200, height: 75)
                .background(color)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        }
    }
}
