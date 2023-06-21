//
//  RegisterViewModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage = ""
    
    func register() {
        errorMessage = ""
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self ]result, error in
            guard let self = self else { return }
            guard let userID = result?.user.uid else {
                return }
            self.insertUserToDatabase(id: userID)
        }
    }
    
    private func insertUserToDatabase(id: String) {
        let newUser = UserModel(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let dataBase = Firestore.firestore()
        dataBase.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
              errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count > 6 else {
            errorMessage = "Password need min. 6 charaters"
            return false
        }
        
        return true
    }
    
    init() {}
}
