//
//  UwerRow.swift
//  Chattos
//
//  Created by hosam on 20/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct UwerRow: View {
    
    var data : UserModel
    
    var body : some View{
        
        HStack(spacing: 12){
            
            WebImage(url: URL(string:data.pic)!)
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12) {
            
                Text(data.username)
                
                Text(data.bio).font(.caption)
                
                Divider()
                    .frame(height:2)
                    .foregroundColor(.gray)
            }
            
            Spacer(minLength: 0)
            
        }.padding(.vertical)
    }
}
