//
//  ChatViewModel.swift
//  chatApp
//
//  Created by 戸田麻陽 on 2021/11/16.
//

import Foundation

class ChatViewModel:ObservableObject{
    @Published var chats = Chat.sampleChat
    
    func getSortedFilterChats(query:String)->[Chat]{
        //$0は最初と$1は2番目のプレスホルダー
        let sortedChats = chats.sorted{
            guard let date1 = $0.message.last?.date else { return false}
            guard let date2 = $1.message.last?.date else{ return false}
            return date1 > date2
        }
        if query == "" {
            return sortedChats
        }
        
        //並べ替え
        return sortedChats.filter{$0.person.name.lowercased().contains(query.lowercased())}
    }
}
