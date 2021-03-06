//
//  AddTaskSheet.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct AddTaskSheet: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var edetingMode: Bool = false
    
    
    
    @State var newTitle: String = ""
//    @Binding var showAddTaskSheet: Bool
    var onSave:(_ success: Bool) -> Void
    
    var body: some View {
        ZStack {
            VStack {

                HStack {
                    TextField("Some text", text: self.$newTitle, onEditingChanged: {
                        edit in
                        if edit {
                            self.edetingMode = true
                        } else {
                             self.edetingMode = false
                        }
                    })
                        .padding(.leading)
                        .padding([.bottom,.top], 10)
                        .background(colorScheme == .dark ? gray : Color.white)
                        
                        .multilineTextAlignment(.leading)
                        .font(.custom("Nunito-SemiBold", size: 16))
                    
                    }.padding([.trailing, .leading], 40).padding([.top, .bottom]).shadow(color: Color(red: 214/255, green: 214/255, blue: 214/255), radius: 6, x: 0, y: 8)
                .padding(.top, 30)
                
                HStack {
                    
                    Button(action: {
                        self.saveTask()
                    }) {
                        Text("Save")
                            .foregroundColor(gray)
                            .multilineTextAlignment(.center)
                            .font(.custom("OpenSans-Regular", size: 20))
                    }
                    
                    
                }.padding([.leading, .trailing], 30)
                    .background(green).cornerRadius(60)
                    .shadow(color: gray, radius: 6, x: 0, y: 3)
                
                Spacer()
                
            }.background(Color.white)
                
            
        }.edgesIgnoringSafeArea(.all)
        
        .cornerRadius(20)
            
            
            .animation(.default)
        
    }
            
    
    func saveTask() {
        guard self.newTitle != "" else {
            return
        }
        let vm = AddTaskViewModel()
        vm.title = self.newTitle
        
        vm.saveTask{
            self.newTitle = ""
//            self.showAddTaskSheet = false
            self.onSave(true)
        }
        
    }
    
}
