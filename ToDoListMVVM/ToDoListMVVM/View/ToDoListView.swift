//
//  ToDoListView.swift
//  ToDoListMVVM
//
//  Created by BPIMA_ALW1090 on 12/6/24.
//

// Views/ToDoListView.swift
import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var newToDoTitle: String = ""
    @State private var selectedToDo: ToDo? = nil

    var body: some View {
        NavigationView {
            VStack {
                
                if(viewModel.todos.count == 0)
                {
                    Text("There are no task to do")
                }
                List {
                    
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted, color: .black)
                                .foregroundColor(todo.isCompleted ? .gray : .black)
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                                    .foregroundColor(todo.isCompleted ? .green : .gray)
                            }.onTapGesture {
                                viewModel.toggleCompletion(for: todo)
                            }
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "pencil")
                                    .foregroundColor(.blue)
                            }.onTapGesture {
                                selectedToDo = todo
                            }
                        }.padding(.vertical, 4)
                            
                    }
                    .onDelete(perform: viewModel.removeToDo)
                }.sheet(item: $selectedToDo) { todo in
                    EditToDoView(todo: binding(for: todo))
                }
            }.toolbar {
                
                NavigationLink(destination: AddToDoView(todoViewModel: viewModel)) {
                            Text("Add")
                            .foregroundColor(.blue)
                       }
                EditButton()
            }
        }
    }

    private func binding(for todo: ToDo) -> Binding<ToDo> {
        guard let index = viewModel.todos.firstIndex(where: { $0.id == todo.id }) else {
            fatalError("To-Do not found")
        }
        return $viewModel.todos[index]
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
