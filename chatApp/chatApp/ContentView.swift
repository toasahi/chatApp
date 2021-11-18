//
//  ContentView.swift
//  chatApp
//
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ChatViewModel()
    
    @State private var query = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.getSortedFilterChats(query: query)){ chat in
                    ChatRow(chat: chat)
        }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("トーク")
            .navigationBarItems(trailing:Button(action:{}){
                Image(systemName: "square.and.pencil")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
