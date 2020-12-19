//
//  cellView.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct cellView: View {
   
    var data : Msg
    
    var body : some View{
        
        HStack(spacing: 12){
            
            Image(systemName: data.img)
//            Image(data.img)
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12) {
            
                Text(data.name)
                
                Text(data.msg).font(.caption)
            }
            
            Spacer(minLength: 0)
            
            VStack{
                
                Text(data.date)
                
                Spacer()
            }
        }.padding(.vertical)
    }
    
}

struct cellView_Previews: PreviewProvider {
    static var previews: some View {
        cellView(data: data[0])
    }
}
