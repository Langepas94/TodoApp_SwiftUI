//
//  ProfileViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    // MARK: - public properties
    
    @Published var user: UserModel? = nil
    
    // MARK: public methods
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else { return }
                DispatchQueue.main.async {
                    self?.user = UserModel(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
                }
            }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    // MARK: - init
    
    init() {}
}
