//
//  Centerview.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct Centerview : View {
    
    @Binding var expand : Bool
    @Binding var messages:[Msg]
//    @ObservedObject var messagesVM = UserViewModel()

    var body : some View{
        
        ScrollView{
        
            VStack(spacing:15) {
                
                ForEach(messages) {app in
//                    SecondcellView(data: $messagesVM.messages[getIndex(item: app)])
                    cellView(data : app)
                }
                
            }
            .padding()
        }
//        .padding(.top, 20)
        .background(Color.white)
        
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
