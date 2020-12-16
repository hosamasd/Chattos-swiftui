//
//  ContentView.swift
//  Chattos
//
//  Created by hosam on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            RegisterView()
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
