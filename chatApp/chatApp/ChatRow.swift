//
//  ChatRow.swift
//  chatApp
//
//

import SwiftUI

struct ChatRow: View {
    var body: some View {
        HStack(spacing:20){
            Image("img1")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text("Ito Marika")
                            .bold()
                        
                        Spacer()
                        
                        Text("2020/11/12")
                    }
                    VStack{
                        Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
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
        ChatRow()
    }
}
