//
//  ToDoViewModel.swift
//  ToDoListMVVM
//
//  Created by BPIMA_ALW1090 on 12/6/24.
//
import Foundation
import Combine

class ToDoViewModel: ObservableObject {
    @Published var todos: [ToDo] = []{
        didSet{
            saveToDos()
        }
    }

    private var todosKey = "ToDosKeyList"
    
    // Initialize with some sample data
    init() {
        loadToDos()
    }

    func addToDo(title: String) -> Bool{
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return false }
        let newToDo = ToDo(title: trimmedTitle)
        todos.append(newToDo)
        return true
    }

    func toggleCompletion(for todo: ToDo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }

    func removeToDo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    private func saveToDos() {
           if let encodedData = try? JSONEncoder().encode(todos) {
               UserDefaults.standard.set(encodedData, forKey: todosKey)
           }
       }
    
   private func loadToDos() {
       if let data = UserDefaults.standard.data(forKey: todosKey),
          let decodedToDos = try? JSONDecoder().decode([ToDo].self, from: data) {
           todos = decodedToDos
       }
   }
}
