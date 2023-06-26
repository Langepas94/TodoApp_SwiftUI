//
//  MainViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    // MARK: - public properties
    
    @Published var currentUserID: String = ""
    @Published var completion: AuthStateDidChangeListenerHandle?
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
    }
    
    // MARK: - public methods
    
    func checkAuth() {
        self.completion = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.currentUserID = user?.uid ?? ""
                
            }
        }
    }
    
    init() {
        checkAuth()
        
    }
}
