//
//  MenuButton.swift
//  Task Timer
//
//  Created by Max Aryus on 10.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            Image(systemName: "square.fill")
                .resizable()
                .frame(width: 11, height: 11)
                .foregroundColor(blue)
            
        }.shadow(color: .gray, radius: 6, x: 0, y: 3)
            .padding(.leading, 21)
    }
}
