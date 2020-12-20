//
//  Centerview.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct Centerview : View {
    
//    @Binding var expand : Bool
//    @Binding var users:[UserModel]
    @ObservedObject var messagesVM = UserViewModel()

    var body : some View{
        
        if messagesVM.users.isEmpty{

            Spacer(minLength: 0)

            if messagesVM.noUserss{

                Text("No Users !!!")
            }
            else{

                ProgressView()
            }
//
            Spacer(minLength: 0)
        }
        else {
        
        ScrollView{
        
            VStack(spacing:15) {
                
                ForEach(messagesVM.filtered) {app in
                    UwerRow(data: app)
//                    SecondcellView(data: $messagesVM.messages[getIndex(item: app)])
//                    cellView(data : app)
                }
                
            }
            .padding()
        }
        
        }
//        .padding(.top, 20)
//        .background(Color.white)
        
    }
    
//    func getIndex(item: Msg)->Int{
//        
//        return messagesVM.messages.firstIndex { (item1) -> Bool in
//            return item.id == item1.id
//        } ?? 0
//    }

}

//struct Centerview_Previews: PreviewProvider {
//    static var previews: some View {
//        Centerview(expand: .constant(false))
//    }
//}
