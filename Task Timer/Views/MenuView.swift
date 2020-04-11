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
                    .foregroundColor(green)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(green)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 100)
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(green)
                    .imageScale(.large)
                Text("Statistics")
                    .foregroundColor(green)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(green)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(green)
                    .font(.custom("Nunito-SemiBold", size: 20))
            }.padding(.top, 30)
            Spacer()
        }
    .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
