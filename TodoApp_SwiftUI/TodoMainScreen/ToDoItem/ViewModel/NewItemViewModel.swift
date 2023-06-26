//
//  NewItemViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation

class NewItemViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false}
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        return true
    }
    
    func save() {
        
    }
    
    init() {}
}
