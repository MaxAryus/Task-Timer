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
    
    @State var sliderValue: Double = 5.0
    @State var showSlider: Bool = true
    
    
    @State var currentDate: Date?
    @State var timerIsRunning: Bool = false
    @State var label: Int = 5
    @State var beginningDate: Date?
    @State var endDate: Date?
    @State var minutesLeft: Int?
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
                        Text("\(self.timerIsRunning ? self.label : Int(self.sliderValue))")
                            .font(.custom("Nunito-Bold", size: 40)).foregroundColor(gray)
                    }
                    
                }
            }.padding()
//  Touchgesture for hiding the slider
                .gesture(TapGesture(count: 2)
                    .onEnded({ (_) in
                        // ShowSlider, deleteTimer
                        if self.timerIsRunning == false {
                            self.showSlider.toggle()
                        } else if self.timerIsRunning == true {
                            self.deleteCountDown()
                        }

                    })
            )
                
//  Touchgesture for starting and stopping the Countdown
                    .gesture(TapGesture(count: 1)
                        .onEnded({ (_) in
                           // Start, Pause timer
                            self.timerIsRunning.toggle()
                            self.startTimer()
                        })
                )
                
//  Slider value stepping with 5
            HStack {
                if showSlider {
                    Slider(value: $sliderValue, in: 5...60, step: 5).padding([.leading, .trailing], 20).background(shadow(radius: 6))
                }
                
            }
        }
    }
//    MARK: - Functions
    
    func deleteCountDown() {
        timer.invalidate()
        self.minutesLeft = 0
        self.timerIsRunning = false
        self.showSlider     = true
        
    }
    
    func countDown() {
        if self.minutesLeft! < 0 {
            self.label = self.minutesLeft! * (-1)
        } else {
            timer.invalidate()
            self.timerIsRunning = false
            self.showSlider = true
        }
        
    }
    
    
    func startTimer() {
        
        if timerIsRunning {
            self.showSlider = false
            
            let date = NSDate()
            let components = calendar.dateComponents([.hour, .minute,], from: date as Date)
            self.beginningDate = calendar.date(from: components)
            
            self.endDate = calendar.date(byAdding: .minute, value: Int(sliderValue), to: self.beginningDate!)
            
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(seconds * 30), repeats: true, block: { (_) in
                
                let date = NSDate()
                let components = calendar.dateComponents([.hour, .minute], from: date as Date)
                self.currentDate = calendar.date(from: components)
                
                let difference = calendar.dateComponents([.hour, .minute], from: self.endDate! as Date, to: self.currentDate!)
                

                
                var hoursLeft = difference.hour
                self.minutesLeft = difference.minute
                                
                if hoursLeft! > 0 {
                    hoursLeft! -= 1
                    self.minutesLeft! += 60
                }
                
                self.countDown()
            })
            
        }
          
    }
    
}




//      MARK: - Preview

struct TaskTimer_Previews: PreviewProvider {
    static var previews: some View {
        TaskTimer()
    }
}

