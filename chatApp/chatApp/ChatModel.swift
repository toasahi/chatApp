//
//  ChatModel.swift
//  chatApp
//
//

import Foundation

struct Chat:Identifiable{
    var id:UUID{
        person.id
    }
    let person: Person
}

struct Person:Identifiable{
    let id = UUID()
    let name: String
    let imgString:String
}

struct Message:Identifiable{
    
    enum MessageType{
        case Sent,Recived
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text:String,type:MessageType,date:Date){
        self.date = date
        self.text = text
        self.type = type
    }
    
    init(_ text:String,type:MessageType){
        self.init(text,type:type,date:Date())
    }
    
    
}
