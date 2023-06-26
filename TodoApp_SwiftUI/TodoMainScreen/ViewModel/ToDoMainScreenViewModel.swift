//
//  ToDoMainScreenViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation

/// Primary tab
/// viewmodel for list of items view
///
class ToDoMainScreenViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    init() {}
}
