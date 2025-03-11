//
//  ContentView.swift
//  DietDice-v2
//
//  Created by Darol on 3/5/25.
//

import Amplify
import Authenticator
import SwiftUICore
import SwiftUI

struct ContentView: View {
    // Create an observable object instance.
    @StateObject var vm = TodoViewModel()
    
    var body: some View {
        Authenticator { state in
            VStack {
                Button("Sign out") {
                    Task {
                        await state.signOut()
                    }
                }
                List {
                    ForEach($vm.todos, id: \.id) { todo in
                        TodoRow(vm: vm, todo: todo)
                    }
                    .onDelete { indexSet in
                        Task { await vm.deleteTodos(indexSet: indexSet) }
                    }
                }
                .task {
                    await vm.listTodos()
                }
                Button(action: {
                    Task { await vm.createTodo() }
                }) {
                    HStack {
                        Text("Add a New Todo")
                        Image(systemName: "plus")
                    }
                }
                .accessibilityLabel("New Todo")
            }
        }
    }
}

#Preview {
    ContentView()
}
