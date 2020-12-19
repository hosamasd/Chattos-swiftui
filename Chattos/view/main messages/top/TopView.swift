//
//  TopView.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct TopView: View {
    
    @Binding var text: String
    
       @State private var isEditing = false
    @Binding var expand : Bool
    @State var colums = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
//@StateObject var messagesVM = UserViewModel()
    @Binding var messages:[Msg]

    var body : some View{
        
        VStack(spacing: 22){
            
            if self.expand{
                
                HStack{
                    
                    Text("Messages")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.7))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menu")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color("Color2"))
                                .padding(18)
                            
                        }.background(Color("Color2").opacity(0.5))
                        .clipShape(Circle())
                        
                            ForEach(messages) {rate in
//                                print(rate)
//                                print(msg)
                                Button(action: {
    
                                }) {
                                Image(systemName: rate.img)//"person")
//                                Image(systemName: d.na)
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 60, height: 60)
                                
                            }
                            }
                    }
                }
                
            }
            
          SearchBar(text: $text)
//            .padding()
//                        .background(Color.white)
                        .cornerRadius(8)
//                        .padding(.bottom, 10)
//            HStack(spacing: 15){
//
//                Image(systemName: "magnifyingglass")
//                    .resizable()
//                    .frame(width: 18, height: 18)
//                    .foregroundColor(Color.black.opacity(0.3))
//
//                TextField("Search", text: self.$search)
//
//            }.padding()
//            .background(Color.white)
//            .cornerRadius(8)
//            .padding(.bottom, 10)
            
        }
        .padding()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("Color1"))
        .clipShape(shape())
        .animation(.default)
        
    }
    
}

//struct TopView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopView( expand: .constant(false))
//    }
//}
