//
//  Costume.swift
//  Task Timer
//
//  Created by Max Aryus on 02.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI


    let green   = Color(red: 38/255, green: 191/255, blue: 10/255)
    let blue    = Color(red: 55/255, green: 160/255, blue: 237/255)
    let black   = Color(red: 33/255, green: 33/255, blue: 33/255)
    let gray    = Color(red: 112/255, green: 112/255, blue: 112/255)
    let shadow  = Color(red: 0/255, green: 0/255, blue: 0/255)
    
    var timer   = Timer()
    let seconds = 1
    let minutes = 60

//    MARK: - Calendar

let calendar = Calendar.current

//    MARK: - Lists

let rowHight: CGFloat = 40
