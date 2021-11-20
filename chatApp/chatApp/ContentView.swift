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
                    ZStack{
                        ChatRow(chat: chat)
                        NavigationLink(destination:{
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
                        }){
                           EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width:0)
                        .opacity(0)
                    }
                    .swipeActions(edge:.leading,allowsFullSwipe: true){
                        Button(action:{
                            viewModel.markAsUnread(!chat.hasUnread, chat: chat)
                        }){
                            if chat.hasUnread{
                                Label("Read",systemImage: "text.bubble")
                            }else{
                                Label("Unread",systemImage: "circle.fill")
                            }
                        }
                        .tint(.blue)
                    }
                    
                    
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
