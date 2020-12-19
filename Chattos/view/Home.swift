//
//  Home.swift
//  Social App
//
//  Created by Balaji on 14/09/20.
//

import SwiftUI

struct Home: View {
    
    @State var index = 0
    @State var expand = false
    @State var selectedTab = "Posts"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            // Custom Tab Bar....
            
            ZStack{
                
                PostView()
                    .opacity(selectedTab == "Posts" ? 1 : 0)
                
//                Chats(expand: self.$expand).opacity(selectedTab == "Settingss" ? 1 : 0)

                SecondChats(expand: self.$expand).opacity(selectedTab == "Settingss" ? 1 : 0)

                
                SettingsView()
                    .opacity(selectedTab == "Settings" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab)
                .padding(.bottom,edges!.bottom == 0 ? 15 : 0)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}


struct ContentViews_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
