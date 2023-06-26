//
//  extension + Encodable.swift
//  TodoApp_SwiftUI
//
//  Created by Artem on 21.06.2023.
//

import Foundation

//MARK: - extension for firebase document writing

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:]}
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
            print(error)
        }
    }
}
