////
////  Home.swift
////  Stacked Carousel Slider
////
////  Created by hosam on 20/12/2020.
////
//
//import SwiftUI
//
//struct HomeCursolView: View {
//    
//    // 40 = padding horizontal
//    // 60 = 2 card to right side...
//    @StateObject var postData = PostViewModel()
//
//    var width = UIScreen.main.bounds.width - (40 + 60)
//    var height = UIScreen.main.bounds.height / 2
//
//    @State var swiped = 0
//
//    
//    var body: some View {
//        
//        VStack {
//            
//            HStack {
//                
//                Text("Custom Carousel")
//                    .font(.title)
//                    .fontWeight(.heavy)
//                
//                
//                Spacer(minLength: 0)
//                
//                Button(action: {}) {
//                    
//                    Image(systemName: "circle.grid.2x2.fill")
//                        .font(.system(size: 22))
//                    
//                }
//                
//            }
//            .foregroundColor(Color.white)
//            .padding()
//            
//            Spacer(minLength: 0)
//            
//            ZStack{
//                
//                // since its zstack it overlay one on another so reversed....
//                
//                ForEach(postData.cursolPosts.reversed()){book in
//                    
//                    HStack{
//                        
//                        ZStack {
//                            Image(book.image)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: width, height: getHeight(index: book.id))
//                                .cornerRadius(25)
//                                // Little Shadow...
//                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5)
//                       
//                        
//                        
//                        // Read More Button...
//                        
//                        CardView(card: book)
//                            .frame(width: width, height: getHeight(index: book.id))
//                        
//                    }
//                        .offset(x: book.id - swiped < 3 ? CGFloat(book.id - swiped) * 30 : 60)
//
//                        Spacer(minLength: 0)
//                        
//                    }
//                    
//                    // Content Shape For Drag Gesture...
//                    .contentShape(Rectangle())
//                    .padding(.horizontal,20)
//                    // gesture...
//                    .offset(x: book.offset)
//                    .gesture(DragGesture().onChanged({ (value) in
//                        withAnimation{onScroll(value: value.translation.width, index: book.id)}
//                    }).onEnded({ (value) in
//                        withAnimation{onEnd(value: value.translation.width, index: book.id)}
//                    }))
//                    
//                }
//            }
//            .frame(height:height)
//            
//            PageViewController(total: postData.posts.count, current: $swiped)
//                .padding(.top,25)
//            
//            Spacer(minLength: 0)
//            
//        }
//        .background(Color("bgg").ignoresSafeArea(.all, edges: .all))
//        
//    }
//    
//    // dynamic height Change...
//    
//    func getHeight(index : Int)->CGFloat{
//        
//        // two card = 80
//        // all other are 80 at background....
//        
//        // automatic height and offset adjusting...
//        
//        return height - (index - swiped < 3 ? CGFloat(index - swiped) * 40 : 80)
//    }
//    
//    func onScroll(value: CGFloat,index: Int){
//        let books = postData.cursolPosts
//        if value < 0{
//            
//            // Left Swipe...
//            
//            if index != books.last!.id{
//                
//                postData.cursolPosts[index].offset = value
//            }
//        }
//        else{
//            
//            // Right Swipe....
//            
//            // Safe Check...
//            if index > 0{
//                
//                if postData.cursolPosts[index - 1].offset <= 20{
//                
//                    postData.cursolPosts[index - 1].offset = -(width + 40) + value
//                }
//            }
//        }
//    }
//    
//    func onEnd(value: CGFloat,index: Int){
//        let books = postData.cursolPosts
//        if value < 0{
//            
//            if -value > width / 2 && index != books.last!.id{
//                
//                postData.cursolPosts[index].offset = -(width + 100)
//                swiped += 1
//            }
//            else{
//                
//                postData.cursolPosts[index].offset = 0
//            }
//        }
//        else{
//            
//            if index > 0{
//                
//                if value > width / 2{
//                    
//                    postData.cursolPosts[index - 1].offset = 0
//                    swiped -= 1
//                }
//                else{
//                    
//                    postData.cursolPosts[index - 1].offset = -(width + 100)
//                }
//            }
//        }
//    }
//    
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
