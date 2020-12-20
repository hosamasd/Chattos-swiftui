//
//  SecondChats.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct SecondChats: View {
//    @Binding var expand : Bool
    
    @StateObject var messagesVM = UserViewModel()

//    @Binding var messagesVM: UserViewModel
//    @State var filteredItems:[MsgModel] = data

    var body : some View{
        
            
        CustomNavigationView(view: AnyView( Centerview( messagesVM: messagesVM)), placeHolder: "Search name users", largeTitle: true, title: "Users",
                                 
                onSearch: { (txt) in

                // filterting Data...
                if txt != ""{
                    self.messagesVM.filtered = messagesVM.users.filter{$0.username.lowercased().contains(txt.lowercased())}
                }
                else{
                    self.messagesVM.filtered = messagesVM.users
                }
                
            }, onCancel: {
                // Do Your Own Code When Search And Canceled....
                self.messagesVM.filtered = messagesVM.users
                
            })
//        }
    }
    
}
