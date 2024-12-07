//
//  ToDo.swift
//  ToDoListMVVM
//
//  Created by BPIMA_ALW1090 on 12/6/24.
//

import Foundation

struct ToDo: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(title: String = "", isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
