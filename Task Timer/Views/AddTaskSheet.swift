//
//  AddTaskSheet.swift
//  Task Timer
//
//  Created by Max Aryus on 11.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import SwiftUI

struct AddTaskSheet: View {
    
    @State var newTitle = ""
    @Binding var showAddTaskSheet: Bool
    var onSave:(_ success: Bool) -> Void
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add Task", text: self.$newTitle)
                Spacer()
                Button(action: {
                    self.saveTask()
                    print(DataManager.shared.getTasks().count)
                }) {
                    Image(systemName: "square")
                }
            }
        }.padding()
        
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
//
//struct AddTaskSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskSheet(showAddTaskSheet: .constant(false))
//    }
//}
