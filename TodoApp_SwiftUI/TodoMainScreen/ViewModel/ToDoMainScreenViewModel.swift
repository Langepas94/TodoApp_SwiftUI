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
    
    @Published var showingNewItemView = false
    private let userID: String
    
    func delete(itemID: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(itemID)
            .delete()
    }
    
    init(userID: String) {
        self.userID = userID
    }
}
