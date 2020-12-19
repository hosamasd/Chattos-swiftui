//
//  Chats.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct Chats: View {
    
    @Binding var expand : Bool
    @StateObject var messagesVM = UserViewModel()
    @State var filteredItems:[Msg] = data

    @State var text = ""
    
    var body : some View{
        
        VStack(spacing: 0){
            
            TopView(text:$text, expand: self.$expand, messages: $messagesVM.messages).zIndex(25)
            
            Centerview(expand: self.$expand, messages: $filteredItems).offset(y: -25)
        }
    }
    
}

struct Chats_Previews: PreviewProvider {
    static var previews: some View {
        Chats(expand: .constant(false))
    }
}
