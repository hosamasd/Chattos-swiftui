//
//  SecondChatsss.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct SecondChatsss: View {
    
    @StateObject var messagesVM = UserViewModel()
    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    
    var body: some View {
       
        VStack{
//
            HStack{

                Text("Users")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)

                Spacer(minLength: 0)

                Button(action: {messagesVM.newUser.toggle()}) {

                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                }
            }
            .padding()
            .padding(.top,edges!.top)
            // Top Shadow Effect...
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
//
            if messagesVM.users.isEmpty{

                Spacer(minLength: 0)

                if messagesVM.noUserss{

                    Text("No Messages !!!")
                }
                else{

                    ProgressView()
                }
//
                Spacer(minLength: 0)
            }
            else{

                ScrollView{
                
                    VStack(spacing:15) {
                        
                        ForEach(messagesVM.users) {app in
        //                    SecondcellView(data: $messagesVM.messages[getIndex(item: app)])
//                            cellView(data : app)
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $messagesVM.newUser) {
            
            SecondChats()
//            NewPost(updateId : $postData.updateId)
        }
        
    }
}
