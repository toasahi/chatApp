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
                ForEach(0..<10){ index in
                    ChatRow()
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
