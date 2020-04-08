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
    @Binding var workedTime: Int
    
    @State var sliderValue: Double = 5.0
    @State var showSlider: Bool = true
    
    @State private var currentDate: Date?
    @State private var beginningDate: Date?
    @State private var endDate: Date?
    @State private var minutesleft: Int?
    @State private var timerIsRunning: Bool = false
    @State private var upcommingWorkingTime: Int?
    
    @State private var timerDeleted: Bool = false
    
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 185, height: 185, alignment: .center).shadow(color: gray, radius: 9, x: 0, y: 3)
                        .overlay(
                            Circle().stroke(green, lineWidth: 6)
                    ).foregroundColor(.white)
                    Text("\(Int(self.sliderValue))")
                        .font(.custom("Nunito-Bold", size: 40)).foregroundColor(gray)
                }
            }.padding()
//  Touchgesture Double Tap -> Show/ hide Slider, if timer is Running Delete Timer
                
                .gesture(TapGesture(count: 2)
                    .onEnded({ (_) in
                        if self.timerIsRunning {
                            self.delteTimer()
                        } else if self.timerIsRunning == false {
                            self.showSlider.toggle()
                            self.timerDeleted = false
                        }
                    })
            )
//  Touchgesture one Tap -> Start/ Stop countdown
                .gesture(TapGesture(count: 1)
                    .onEnded({ (_) in
                        self.timerIsRunning.toggle()
                        self.timerDeleted = false
                        self.statTimer()
                    })
            )
            
//  SliderView
            HStack {
                if self.timerDeleted {
                    Text("Timer deleted")
                        .font(.custom("Nunito-ExtraLight", size: 15)).foregroundColor(.red)
                    
                    .background(green).cornerRadius(10)
                }

            }.frame(width: 250, height: 10, alignment: .center)
            HStack {
                if showSlider {
                    Slider(value: $sliderValue, in: 5.0...60.0, step: 5.0)
                } else if self.timerIsRunning {
                    Text("Timer is running keep working").padding([.leading, .trailing], 20)
                        .font(.custom("Nunito-ExtraLight", size: 15)).foregroundColor(gray).background(green).cornerRadius(5).shadow(color: gray, radius: 6, x: 0, y: 3)
                }
                
            }.padding([.trailing, .leading], 20)
            
        }
    }
    
//      MARK: - Functions
    
    func statTimer() {
        if timerIsRunning {
            self.showSlider = false
            self.upcommingWorkingTime = Int(self.sliderValue)
            let date = NSDate()
            let components = calendar.dateComponents([.hour, .minute,], from: date as Date)
            
            self.beginningDate = calendar.date(from: components)
            self.endDate       = calendar.date(byAdding: .minute, value: Int(sliderValue), to: self.beginningDate!)
            
            timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(seconds * 30), repeats: true, block: { (_) in
                
                let date = NSDate()
                let components = calendar.dateComponents([.hour, .minute], from: date as Date)
                self.currentDate = calendar.date(from: components)
                
                let differnce = calendar.dateComponents([.hour, .minute], from: self.endDate! as Date, to: self.currentDate!)
                
                var hoursLeft = differnce.hour
                self.minutesleft = differnce.minute
                
                if hoursLeft! > 0 {
                    hoursLeft! -= 1
                    self.minutesleft! += 60
                }
                
                self.minutesleft = self.minutesleft! * (-1)
                
                self.countDown()
                
            })
        
        }
    }
    
    func countDown() {
        if self.minutesleft! > 0 {
            self.sliderValue = Double(self.minutesleft!)
        } else {
            timer.invalidate()
            self.sliderValue = 5
            self.timerIsRunning = false
            self.showSlider = true
            self.workedTime += self.upcommingWorkingTime!
        }
    }
    
    
    func delteTimer() {
        timer.invalidate()
        self.timerIsRunning = false
        self.minutesleft = 0
        self.sliderValue = 5
        self.showSlider = true
        self.timerDeleted = true
    }
    
}




//      MARK: - Preview

struct TaskTimer_Preview: PreviewProvider {
    static var previews: some View {
        TaskTimer(workedTime: .constant(0))
    }
}
