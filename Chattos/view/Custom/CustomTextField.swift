//
//  CustomTextField.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI

struct CustomTextField : View {
    
    var image : String
    var placeHolder : String
    @State var showOrHide = false
    
    @Binding var txt : String
    var type:UIKeyboardType = .default
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            Button(action: {
                self.showOrHide.toggle()
                print(123)
            }, label: {
               
            
            
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("bottom"))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
                
            })
            
            ZStack{
                
                if placeHolder == "Password" || placeHolder == "Re-Enter"{
                    ZStack {
                        if showOrHide{
                            TextField(placeHolder, text: $txt)
                        }else {
                            SecureField(placeHolder, text: $txt)
                        }
                    }
                    
                    
                }
                else{
                    TextField(placeHolder, text: $txt)
                        .keyboardType(type)
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(.horizontal)
       
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(image: "pencil.circle", placeHolder: "Password", txt: .constant(""))
    }
}
