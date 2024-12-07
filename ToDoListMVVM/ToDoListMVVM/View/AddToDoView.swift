//
//  AddToDoView.swift
//  ToDoListMVVM
//
//  Created by BPIMA_ALW1090 on 12/6/24.
//
import SwiftUI

struct AddToDoView: View {
    @State private var todo: ToDo = ToDo()
    @State private var wasSave:Bool = true
    @ObservedObject var todoViewModel:ToDoViewModel = ToDoViewModel();
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                Section{
                    TextField("Title", text: $todo.title)
                }
                if wasSave == false{
                    Text("There is an error in the form")
                }
            }
            .navigationTitle("Add a task")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        wasSave = todoViewModel.addToDo(title: todo.title)
                        if wasSave == true {
                            dismiss()
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    let todoViewModel = ToDoViewModel()
    
    AddToDoView(todoViewModel:todoViewModel)
}
