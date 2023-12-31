//
//  NewItemViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    
    // MARK: - public properties
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false}
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
    
    // MARK: - public methods
    
    func save() {
        guard canSave else { return }
        guard let uID = Auth.auth().currentUser?.uid else { return }
        
        let newID = UUID().uuidString
        let newTodo = ToDoListItemModel(id: newID, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newID)
            .setData(newTodo.asDictionary())
    }
    
    // MARK: init
    
    init() {}
}
