//
//  ContentView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoMainListView: View {
    
    // MARK: public properties
    
    @StateObject var viewModel: ToDoMainScreenViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    
    var body: some View {
        
        // MARK: - navigation view
        NavigationView {
            
            // MARK: - list of all items
            
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(itemID: item.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("ToDo list")
            .toolbar {
                
                // MARK: - new task button
                
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
    
    // MARK: - init
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoMainScreenViewModel(userID: userID))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoMainListView(userID: "s077rRTZyTe4vJUbD4hzJCxESP23")
    }
}
