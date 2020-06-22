//
//  NewTaskViewModle.swift
//  Task Timer
//
//  Created by Max Aryus on 22.06.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct NewTaskViewModle: View {
    @State var newTitle: String = ""
    @State var isHidden: Bool = false
    var onSave:(_ success: Bool) -> Void
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Circle()
                    .foregroundColor(taskViewGray)
                        .frame(width: 33, height: 33, alignment: .center)
                        .padding(.trailing)
                }
            }
            .padding(.bottom, 40)
            
            ZStack {
                Rectangle()
                .foregroundColor(taskViewGray)
                .frame(width: 350, height: 60, alignment: .center)
               Rectangle()
                .foregroundColor(.white)
                .frame(width: 336, height: 45, alignment: .center)
                TextField("Some Text", text: self.$newTitle)
                    .frame(width: 330, height: 40, alignment: .center)
                    
            }
            
            Spacer()
            
        }
    }
    
    func saveTask() {
        guard self.newTitle != "" else {
            return
        }
        let vm = AddTaskViewModel()
        vm.title = self.newTitle
        
        vm.saveTask{
            self.newTitle = ""
            self.isHidden = false
            self.onSave(true)
        }
        
    }
    
}

