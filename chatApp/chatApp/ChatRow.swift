//
//  ChatRow.swift
//  chatApp
//
//

import SwiftUI

struct ChatRow: View {
    
    let chat:Chat
    
    var body: some View {
        HStack(spacing:20){
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(chat.person.name)
                            .bold()

                        Spacer()
                        
                        Text(chat.message.last?.date.descriptionString() ?? "")
                    }
                    VStack{
                        Text(chat.message.last?.text ?? "")
                            .foregroundColor(Color.gray)
                            .lineLimit(2)
                            .frame(height:50,alignment: .top)
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .padding(.trailing,40)
                    }
                }
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
