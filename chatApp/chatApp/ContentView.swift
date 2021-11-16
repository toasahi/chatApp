//
//  ContentView.swift
//  chatApp
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(Chat.sampleChat){ chat in
                    ChatRow(chat: chat)
                }
            }
            .listStyle(PlainListStyle())
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
