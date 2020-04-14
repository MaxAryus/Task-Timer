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
    @Binding var showAddTaskSheet: Bool
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
                        .cornerRadius(20)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Nunito-SemiBold", size: 16))
                    
                }.padding([.trailing, .leading], 40).padding([.top, .bottom])
                
                HStack {
                    
                    Button(action: {
                        self.saveTask()
                    }) {
                        Text("Add task")
                            .foregroundColor(gray)
                            .multilineTextAlignment(.center)
                            .font(.custom("Nunito-Bold", size: 20))
                    }
                    
                    
                }.padding([.leading, .trailing], 30)
                    .background(green).cornerRadius(60)
                    .shadow(color: gray, radius: 3, x: 0, y: 3)
                
                Spacer()
                
            }.background(blue.opacity(0.8))
                
            
        }.edgesIgnoringSafeArea(.all)
        
        .cornerRadius(20)
            
            .offset(y: edetingMode ? -150 : 55)
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
            self.showAddTaskSheet = false
            self.onSave(true)
        }
        
    }
    
}
