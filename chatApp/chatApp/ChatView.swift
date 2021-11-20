//
//  ChatView.swift
//  chatApp
//
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    @State private var text = ""
    
    let chat:Chat
    
    var body: some View {
        VStack(spacing:0){
            GeometryReader{ reader in
                ScrollView{
                    getMessageView(viewWidth:reader.size.width)
                        .padding(.horizontal)
                }
            }
        }
        .padding(.top,1)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            viewModel.markAsUnread(false, chat: chat)
        }
        
        toolbarView()
       
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]

    func getMessageView(viewWidth:CGFloat) -> some View{
        LazyVGrid(columns:columns,spacing: 0){
            ForEach(chat.message){ message in
                let isReceived = message.type == .Recived
                HStack{
                    ZStack{
                        Text(message.text)
                            .padding(.horizontal)
                            .padding(.vertical,12)
                            .background(isReceived ? Color.black.opacity(0.2) : .green.opacity(0.9))
                            .cornerRadius(13)
                    }
                    .frame(width:viewWidth * 0.7,alignment:isReceived ? .leading : .trailing)
                    .padding(.vertical)
                }
                .frame(maxWidth:.infinity,alignment:isReceived ? .leading : .trailing)
                .id(message.id)
            }
        }
    }

    func toolbarView() -> some View{
        VStack{
            let height:CGFloat = 37
            HStack{
                TextField("Message",text: $text)
                    .padding(.horizontal,10)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thinMaterial)
    }

    struct ChatView_Previews: PreviewProvider {
        static var previews: some View {
            ChatView(chat: Chat.sampleChat[1])
                .environmentObject(ChatViewModel())
        }
    }
}
