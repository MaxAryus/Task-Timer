//
//  TaskTimer.swift
//  Task Timer
//
//  Created by Max Aryus on 04.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI


struct TaskTimer: View {
    
//    MARK: - Properties
    
    @Binding var showSlider: Bool
    
    @State var timerPaused: Bool = true
    
    @State var displayTime: Double = 0.0
    @State var beginningTime: Int = 0
    @State var countDownTime: Int = 0
    @State var runTimer: Bool = false
       
    
//    MARK: - Content
    
    var body: some View {
        VStack {
            HStack {
                VStack {
//  Contains the Timerlabel view
                    ZStack {
                        Circle()
                            .frame(width: 185, height: 185, alignment: .center).shadow(color: .gray, radius: 9, x: 0, y: 3)
                            .overlay(
                                Circle()
                                    .stroke(green, lineWidth: 4)
                        ).foregroundColor(.white)
                        Text("\(Int(self.displayTime))")
                            .font(.custom("Nunito-Bold", size: 40)).foregroundColor(gray)
                    }
                    
                }
            }.padding()
//  Touchgesture for hiding the slider
                .gesture(TapGesture(count: 2)
                    .onEnded({ (_) in
                        if (self.runTimer == true || self.timerPaused == true && self.showSlider == false) {
                            self.willDeleteCountDown()
                        }
//                        else if self.runTimer == false {
//                            self.showSlider.toggle()
//                        }
                    }))
                
//  Touchgesture for starting and stopping the Countdown
                    .gesture(TapGesture(count: 1)
                        .onEnded({ (_) in
                            if (self.runTimer == false && self.displayTime > 0) {
                                self.runTimer = true
                                self.willStartTimer()
                                self.showSlider = false
                                self.timerPaused = false
                                
                                print("timer started: \(Date())")
                                
                            } else if self.runTimer == true && self.timerPaused == false {
                                
                                self.willPauseTimer()
                                
                                print("timer paused")
                                
                            }
                            
                        })
                )
                


//  Slider value witt stepping with 5
            HStack {
                if (self.showSlider == true) {
                    Slider(value: $displayTime, in: 0...120, step: 5).padding([.leading, .trailing], 20)
                }
            }
        }
    }
//    MARK: - Functions
    
    func willStartTimer() {
        if self.runTimer == true {
            startTimer()
        }
        
    }
    
    func willPauseTimer() {
        if self.runTimer == true {
            timer.invalidate()
            self.timerPaused = true
            self.runTimer = false
        }
    }
    
    func willDeleteCountDown() {
        timer.invalidate()
        self.countDownTime  = 0
        self.runTimer       = false
        self.displayTime    = 0.0
        self.showSlider     = true
        print("timer deleted")
    }
    
    func countDown() {
        if self.countDownTime > 0 {
            self.countDownTime -= 1
        } else {
            self.runTimer = false
            timer.invalidate()
            self.showSlider = true
            print("timer endet: \(Date())")
        }
        self.displayTime -= 1
        
    }
    
    func startTimer() {
            self.countDownTime = Int(self.displayTime) - 1
            self.beginningTime = self.countDownTime
            
            timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(seconds), repeats: true, block: { (i) in
                self.countDown()
                
            })
        
        
        
    }
    
    
    
}


//      MARK: - Preview

struct TaskTimer_Previews: PreviewProvider {
    static var previews: some View {
        TaskTimer(showSlider: .constant(true))
    }
}
