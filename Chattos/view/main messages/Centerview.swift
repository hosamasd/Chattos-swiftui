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
    
    var body : some View{
        
        
        
        List(messages){i in
            
            if i.name == "Emily"{
                
                cellView(data : i)
                .onAppear {
                        
                    self.expand = true
                }
                .onDisappear {
                    
                    self.expand = false
                }
            }
            else{
                
                cellView(data : i)
            }
            
        }
        .padding(.top, 20)
        .background(Color.white)
        .clipShape(shape())
    }

}

//struct Centerview_Previews: PreviewProvider {
//    static var previews: some View {
//        Centerview(expand: .constant(false))
//    }
//}
