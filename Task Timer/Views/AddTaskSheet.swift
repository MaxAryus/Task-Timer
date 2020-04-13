//
//  AddTaskSheet.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct AddTaskSheet: View {
    
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
                        .background(Color.white)
                        .padding([.bottom,.top], 10)
                        .multilineTextAlignment(.leading).padding(.leading)
                }.background(Color.white).cornerRadius(40).padding([.leading,.trailing], 20)
                    .padding(.bottom, 30).shadow(color: gray, radius: 3, x: 0, y: 3).padding(.top, 20)
                HStack {
                    Button(action: {
                        self.saveTask()
                    }) {
                        Text("Add task")
                            .foregroundColor(gray)
                            .multilineTextAlignment(.center)
                    }
                }.padding([.leading,.trailing], 30).padding(.bottom, 5).padding(.top, 5).background(green).cornerRadius(60).shadow(color: gray, radius: 3, x: 0, y: 3)
                    Spacer()
            }.background(blue).edgesIgnoringSafeArea(.all).frame(height: 235).cornerRadius(20).padding(.top, 250).padding(.bottom, -45)
        }.offset(y: edetingMode ? -300 : 0).animation(.default)
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
