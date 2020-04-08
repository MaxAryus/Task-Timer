//
//  HamburgerMenue.swift
//  Task Timer
//
//  Created by Max Aryus on 08.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(gray)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(gray)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(gray)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 30)
            Spacer()
        }
    .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(black)
         .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
