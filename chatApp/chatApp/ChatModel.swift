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
    var message: [Message]
    var hasUnread = false
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

extension Chat{
    static let sampleChat = [
        Chat(person:Person(name:"Ito Marika",imgString: "img1"),message: [
            Message("サマーフィルムにのってに出演します",type:.Recived,date:Date(timeIntervalSinceNow: -86400*6)),
            Message("おめでとう😆",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("頑張って!!",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("頑張るわ",type:.Recived,date:Date(timeIntervalSinceNow: -86400*2)),
            Message("応援してます",type:.Sent,date:Date(timeIntervalSinceNow: -86400*0))],hasUnread: true
        ),
        Chat(person:Person(name:"Kudo Asuka",imgString: "img2"),message: [
            Message("有吉ゼミで農業を始めたの見ました。",type:.Sent,date:Date(timeIntervalSinceNow: -86400*3)),
            Message("本当ですか!!",type:.Recived,date:Date(timeIntervalSinceNow: -86400*2)),
            Message("今度訪れてもいいですか？？",type:.Sent,date:Date(timeIntervalSinceNow: -86400*2)),
            Message("いいですよ",type:.Recived,date:Date(timeIntervalSinceNow: -86400*2)),
            Message("ありがとうございます👍",type:.Sent,date:Date(timeIntervalSinceNow: -86400*1))],hasUnread: true
        ),
        Chat(person:Person(name:"Mitushima Shinnosuke",imgString: "img3"),message: [
            Message("グータンヌーボ毎週見てます!",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("ありがとう",type:.Recived,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("いつも服装参考にしています",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("あと、白濱亜嵐さんと横川尚隆さんの回が好きです",type:.Sent,date:Date(timeIntervalSinceNow: -86400*4)),
            Message("あの回はめっちゃ面白かったな",type:.Sent,date:Date(timeIntervalSinceNow: -86400*3))],hasUnread: true
        ),
        Chat(person:Person(name:"Yoshine Kyoko",imgString: "img4"),message: [
            Message("インスタいつも拝見させてもらっています",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("犯人フラグ頑張ってください",type:.Sent,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("ありがとう!!",type:.Recived,date:Date(timeIntervalSinceNow: -86400*5)),
            Message("これからも応援よろしく",type:.Recived,date:Date(timeIntervalSinceNow: -86400*4)),
            Message("応援します",type:.Sent,date:Date(timeIntervalSinceNow: -86400*3))],hasUnread: true
        )
    ]
}
