//
//  Extensions.swift
//  ToDoList
//
//  Created by Ivan Bondaruk on 03/06/2025.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            
            return json ?? [:]
        } catch{
            return [:]
        }
    }
}
