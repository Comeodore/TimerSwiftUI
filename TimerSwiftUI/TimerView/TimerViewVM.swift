//
//  TimerViewVM.swift
//  TimerSwiftUI
//
//  Created by Vladimir Maksymchuk on 10.05.2025.
//

import Foundation
import Observation

@Observable
final class TimerViewVM {
    @ObservationIgnored
    var timer: Timer?
    
    var counter: Int = 3
    var buttonText: String = "Start"
    
    func timerButtonPressed() {
        if buttonText == "Start" {
            startTimer()
            buttonText = "Wait..."
        } else if buttonText == "Reset" {
            counter = 3
            buttonText = "Start"
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            timer?.invalidate()
            timer = nil
            buttonText = "Reset"
        }
    }
}
