//
//  ContentView.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoMainListView: View {
    
    @StateObject var viewModel: ToDoMainScreenViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoMainScreenViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoMainListView(userID: "s077rRTZyTe4vJUbD4hzJCxESP23")
    }
}
