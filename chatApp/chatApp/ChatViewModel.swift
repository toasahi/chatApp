//
//  ChatViewModel.swift
//  chatApp
//
//  Created by 戸田麻陽 on 2021/11/16.
//

import Foundation

class ChatViewModel:ObservableObject{
    @Published var chats = Chat.sampleChat
    
    //seachbarの検索
    func getSortedFilterChats(query:String)->[Chat]{
        //日付で並び替え
        let sortedChats = chats.sorted{
            //$0は最初と$1は2番目のプレスホルダー
            guard let date1 = $0.message.last?.date else { return false}
            guard let date2 = $1.message.last?.date else{ return false}
            return date1 > date2
        }
        if query == "" {
            return sortedChats
        }
        
        //queryで検索
        return sortedChats.filter{$0.person.name.lowercased().contains(query.lowercased())}
    }
    
    func markAsUnread(_ newValue:Bool,chat:Chat){
        if let index = chats.firstIndex(where: {$0.id == chat.id}){
            chats[index].hasUnread = newValue
            
        }
    }
}
