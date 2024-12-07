//
//  EditToDoView.swift
//  ToDoListMVVM
//
//  Created by BPIMA_ALW1090 on 12/6/24.
//

import SwiftUI

struct EditToDoView: View {
    @Binding var todo: ToDo
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Title", text: $todo.title)
                   
                }
            }
            .navigationTitle("Edit To-Do")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct EditToDoView_Previews: PreviewProvider {
    @State static var sampleToDo = ToDo(title: "Sample To-Do")

    static var previews: some View {
        EditToDoView(todo: $sampleToDo)
    }
}
