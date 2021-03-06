//
//  cellView.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct cellView: View {
   
    var data : MsgModel
    
    var body : some View{
        
        HStack(spacing: 12){
            
//            Image(systemName: data.img)
            Image(data.user)
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12) {
            
                Text(data.user)
                
                Text(data.msg).font(.caption)
            }
            
            Spacer(minLength: 0)
            
            VStack{
                
                Text(data.user)
                
                Spacer()
            }
        }.padding(.vertical)
    }
    
}
