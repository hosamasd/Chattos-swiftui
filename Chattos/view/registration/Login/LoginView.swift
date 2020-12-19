//
//  LoginView.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI

struct LoginView : View {
    
    @ObservedObject var model : ModelData
    
    var body: some View{
        
        ZStack{
            
            
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 130, height: 130)
                    }
                    else{
                        Image("logo")
                    }
                }
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(30)
                    .padding(.top)
                
                VStack(spacing: 4){
                    
                    HStack(spacing: 0){
                        
                        Text("Dating")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Match")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("txt"))
                    }
                    
                    Text("lets choose your match")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                }
                .padding(.top)
                
                VStack(spacing: 20){
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email,type: .emailAddress)
                        
                    
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
                }
                .padding(.top)
                
                Button(action:
                        model.login
//                       self.hideKeyboard()
                ) {
                    
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                    
                }
                .padding(.top,22)
                .disabled(!model.checkEmailAndPassword() ? true : false)
                .opacity(!model.checkEmailAndPassword() ? 0.5 : 1)
                
                HStack(spacing: 12){
                    
                    Text("Don't have an account?")
                        .foregroundColor(Color.white.opacity(0.7))
                    
                    Button(action: {model.isSignUp.toggle()}) {
                        
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top,25)
                
                Spacer(minLength: 0)
                
                Button(action: model.resetPassword) {
                    
                    Text("Forget Password?")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical,22)

            }
            
            if model.isLoading{
                
                LoadingView()
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all))
        .fullScreenCover(isPresented: $model.isSignUp) {
            
            SignUpView(model: model)
        }
        // Alerts...
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("Ok")))
        })
        
    }
}


struct LoginVisew_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(model: ModelData())
    }
}


