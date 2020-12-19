//
//  SecondChats.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct SecondChats: View {
    @Binding var expand : Bool
    
    @StateObject var messagesVM = UserViewModel()
    @State var filteredItems:[Msg] = data

    var body : some View{
        
//        VStack(spacing: 0){
            
        CustomNavigationView(view: AnyView( Centerview(expand: self.$expand, messages: $filteredItems)), placeHolder: "Search Apps,Games", largeTitle: true, title: "Hosam Mohamed",
                                 
                onSearch: { (txt) in

                // filterting Data...
//                    messagesVM.makeSearch(txt: txt)
                if txt != ""{
                    self.filteredItems = messagesVM.messages.filter{$0.name.lowercased().contains(txt.lowercased())}
                }
                else{
                    self.filteredItems = messagesVM.messages
                }
                
            }, onCancel: {
                // Do Your Own Code When Search And Canceled....
                self.filteredItems = messagesVM.messages
//                messagesVM.makeSearch(txt: "")
//                self.$messagesVM.message = self.messagesVM.messages
                
            })
            
//            TopView(expand: self.$expand, messages: $messagesVM.messages).zIndex(25)
            
//            Centerview(expand: self.$expand, messages: $messagesVM.messages)
//                .offset(y: -25)
//        }
    }
    
}
