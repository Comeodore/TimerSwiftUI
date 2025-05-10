//
//  TimerSwiftUIApp.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import SwiftUI

@main
struct TimerSwiftUIApp: App {
    @State var timerViewVM = TimerViewVM()
    @State var loginViewVM = LoginViewVM()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(timerViewVM)
        .environment(loginViewVM)
    }
}
