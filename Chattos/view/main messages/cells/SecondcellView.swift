//
//  SecondcellView.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct SecondcellView: View {
  @Binding  var data : Msg
    @GestureState var isDragging = false

    var body : some View{
        
        ZStack{
            
           
            Color(.blue)
                .cornerRadius(20)
                .padding(.trailing,65)
            
            // Button...
            
            HStack{
                
                Spacer()
                
                Button(action: {}) {
                    
                    Image(systemName: "suit.heart")
                        .font(.title)
                        .foregroundColor(.white)
                        // default frame...
                        .frame(width: 65)
                }
                
               
            }
            
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
            }
            .padding()
            .contentShape(Rectangle())
            .offset(x: data.offset)
            .gesture(
//                DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
                DragGesture()
                    .updating($isDragging, body: { (value, state, _) in
                        
                        // so we can validate for correct drag..
                        state = true
                        onChanged(value: value)
                    }).onEnded({ (value) in
                        onEnd(value: value)
                    }))
            //        .padding(.vertical)
        }
        
    }
    
     func onChanged(value: DragGesture.Value){
        
        //true swipe
//        if !rightOrLeft {
//
//
//        if value.translation.width < 0{
//
//            if item.isSwiped{
//                item.offset = value.translation.width - 90
//            }
//            else{
//                item.offset = value.translation.width
//            }
//        }
//        }else{
        
        //left swipe
        
        if value.translation.width > 0{
            
            if data.isSwiped{
                data.offset = value.translation.width + 90
            }
            else{
                data.offset = value.translation.width
            }
        }
        
//        }
    }
    
     func onEnd(value: DragGesture.Value){
        print(value.translation.width)
//        if !rightOrLeft {
//
//        withAnimation(.easeOut){
//
//            if value.translation.width < 0{
//
//                // Checking...
//
//                if -value.translation.width > UIScreen.main.bounds.width / 2{
//
//                    item.offset = -1000
//                    deleteItem()
//                }
//                else if -item.offset > 50{
//                    // updating is Swipng...
//                    item.isSwiped = true
//                    item.offset = -90
//                }
//                else{
//                    item.isSwiped = false
//                    item.offset = 0
//                }
//            }
//            else{
//                item.isSwiped = false
//                item.offset = 0
//            }
//        }
//        }else {
        
        //left swipe
        withAnimation(.easeOut){
            
            if value.translation.width > 0{
                
                // Checking...
                
                if value.translation.width > UIScreen.main.bounds.width / 2{
                    
                    data.offset = 1000
//                    deleteItem()
                }
                else if data.offset > 50{
                    // updating is Swipng...
                    data.isSwiped = true
                    data.offset = 90
                }
                else{
                    data.isSwiped = false
                    data.offset = 0
                }
            }
            else{
                data.isSwiped = false
                data.offset = 0
            }
        }
//        }
        
    }
    
    
}

//struct SecondcellView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondcellView(data: data[0])
//    }
//}
