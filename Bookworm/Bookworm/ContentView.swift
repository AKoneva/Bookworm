//
//  ContentView.swift
//  Bookworm
//
//  Created by Анна Перехрест  on 2023/09/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
    var body: some View {
        VStack {
            NavigationView {
                Text("Count: \(books.count)")
                    .navigationTitle("Bookworm")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingAddScreen.toggle()
                            } label: {
                                Label("Add Book", systemImage: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $showingAddScreen) {
                        AddBookView()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}