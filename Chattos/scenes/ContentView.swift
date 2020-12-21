//
//  ContentView.swift
//  Chattos
//
//  Created by hosam on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("current_status") var status = false
    @AppStorage("log_Status") var logins = false
    @AppStorage("after_log_signuup") var logOrSignup = false

    @StateObject var model = ModelData()

    var body: some View {
//        SecondChats()
//        Home()
//        SignUpView(model: model)
        NavigationView{
//            Home()
            VStack{

                if logOrSignup {
                    if  logins{Home()}
                    else {
                        BasicInfoView()
                    }
                }else {
                    LoginView(model:model)}
            }
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
