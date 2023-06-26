//
//  ToDoListItemView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 26.06.2023.
//

import SwiftUI

struct ToDoListItemView: View {
    
    // MARK: - public properties
    
    let item: ToDoListItemModel
    
    @StateObject var viewModel = ToDoMToDoListItemViewModelainScreenViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "22", title: "Get eggs", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
