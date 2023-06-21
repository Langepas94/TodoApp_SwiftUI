//
//  UserModel.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
