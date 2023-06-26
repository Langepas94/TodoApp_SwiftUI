//
//  ToDoMainScreenViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation
import FirebaseFirestore

/// Primary tab
/// viewmodel for list of items view
///
class ToDoMainScreenViewModel: ObservableObject {
    
    // MARK: - public properties
    
    @Published var showingNewItemView = false
    
    // MARK: - private properties
    
    private let userID: String
    
    // MARK: - public methods
    
    func delete(itemID: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemID)
            .delete()
    }
    
    // MARK: - init
    
    init(userID: String) {
        self.userID = userID
    }
}
