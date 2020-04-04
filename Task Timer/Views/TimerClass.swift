//
//  TimerClass.swift
//  Task Timer
//
//  Created by Max Aryus on 04.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation

class TimerClass {
    
    var start: Date!
    var end: Int!
    var now: Int = Calendar.current.component(.minute, from: Date())
    var timerTime:  Int
    var difference: Int!
    
    init(time: Int) {
        self.timerTime = time
    }
    
    func run() -> Int {
        self.start = Date()
        
        let intStartDate = Calendar.current.component(.minute, from: start)
        
        if (intStartDate + timerTime) > 60 {
            end = (intStartDate + timerTime) - 60
        } else {
            end = intStartDate + timerTime
        }
        
        difference = end - now
        
        return difference
    }
    
}
