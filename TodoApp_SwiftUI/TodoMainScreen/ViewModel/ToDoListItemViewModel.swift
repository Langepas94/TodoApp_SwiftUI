//
//  ToDoListItemViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 26.06.2023.

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// Primary tab
/// viewmodel for single item of items view
class ToDoMToDoListItemViewModelainScreenViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItemModel) {
    var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
