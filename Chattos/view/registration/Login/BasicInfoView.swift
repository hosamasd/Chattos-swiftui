//
//  BasicInfoView.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct BasicInfoView: View {
    
    @StateObject var registerData = RegisterViewModel()

     var email:String = ""
     var password:String = ""
//    @StateObject var registerData = SecondRegisterViewModel()

    func withFrame(isFrame: Bool = false) -> some View {
        return    ZStack {
            
            if registerData.image_Data.count == 0{
            
        Image(systemName: "person")
            .font(.system(size: 65))
            .foregroundColor(.black)
                    .frame(width: 130, height: 130)
            .background(Color.white)
            .clipShape(Circle())
                
            }else {
                
        Image(uiImage: UIImage(data: registerData.image_Data)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 130, height: 130)
            .clipShape(Circle())
            }
        }
//                        .padding(.top)
        .onTapGesture(perform: {
            registerData.picker.toggle()
        })
    }
    
    func withoutFrame() -> some View {
        return    ZStack {
            
            if registerData.image_Data.count == 0{
            
        Image("logo")
            .font(.system(size: 65))
            .foregroundColor(.black)
            .background(Color.white)
            .clipShape(Circle())
                
            }else {
                
        Image(uiImage: UIImage(data: registerData.image_Data)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 130, height: 130)
            .clipShape(Circle())
            }
        }
//                        .padding(.top)
        .onTapGesture(perform: {
            registerData.picker.toggle()
        })
    }
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        withFrame()
                    }
                    else{
                        withoutFrame()
                    }
                }
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                
                VStack(spacing: 20){
                    
                    CustomTextField(image: "person", placeHolder: "Name", txt: $registerData.name)
                    
                    CustomTextField(image: "person", placeHolder: "Bio", txt: $registerData.bio)
                    
                }
                .padding(.top)
                
                Button(action:{ registerData.register(email: email, password: password) }) {
                    
                    Text("Confirm")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(.vertical,22)
                .disabled(registerData.image_Data.count == 0 || registerData.name == "" || registerData.bio == "" ? true : false)
                .opacity(registerData.image_Data.count == 0 || registerData.name == "" || registerData.bio == "" ? 0.5 : 1)
                
                Spacer(minLength: 0)
            }
            
            Button(action: {}) {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top,10)
            
            if registerData.isLoading{
                
                LoadingView()
            }
        })
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $registerData.picker, content: {
            ImagePicker(picker: $registerData.picker, img_Data: $registerData.image_Data)
        })
  
    }
}



struct BasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BasicInfoView()
    }
}
