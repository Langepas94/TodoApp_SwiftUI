//
//  ToDoItemView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 10)
            
            Form {
                TextField("Titile", text: $viewModel.title)
                    .textFieldStyle(.automatic)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                ButtonHelperView(title: "Save", backgroundColor: .pink) {
                    viewModel.save()
                    newItemPresented = false
                }
                .padding()
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _, _ in
            //
        }))
    }
}
