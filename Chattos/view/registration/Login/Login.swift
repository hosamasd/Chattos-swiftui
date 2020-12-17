//
//  Login.swift
//  Chattos
//
//  Created by hosam on 12/17/20.
//

import SwiftUI

//struct Login: View {
//    
//    @AppStorage("log_Status") var status = false
//    @StateObject var model = ModelData()
//    
//    var body: some View {
//    
//        ZStack{
//            
//            if status{
//                
//                VStack(spacing: 25){
//                    
//                    Text("Logged In As \(Auth.auth().currentUser?.email ?? "")")
//                    
//                    Button(action: model.logOut, label: {
//                        Text("LogOut")
//                            .fontWeight(.bold)
//                    })
//                }
//            }
//            else{
//                
//                LoginView(model: model)
//            }
//        }
//        
//    }
//}
//
//struct Login_Previews: PreviewProvider {
//    static var previews: some View {
//        Login()
//    }
//}
