//
//  UserViewModel.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

class UserViewModel: ObservableObject {

//    @Published var messages:[Msg] = []
    @Published var newUser = false
    @Published var noUserss = false
    @Published var filtered:[UserModel] = []
    @Published var users:[UserModel] = []
    
    init() {
        readAllUses()
    }
    
    func readAllMsgs(){
        
        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in
            
            if err != nil{
                print(err!.localizedDescription)
                self.noUserss=true
                return
            }
            
            guard let data = snap else{
                self.noUserss = true
                return

            }

            if data.documentChanges.isEmpty{

                self.noUserss = true
                return
            }

            
            data.documentChanges.forEach { (doc) in
                
                // adding when data is added...
                
                if doc.type == .added{
                    
                    let msg = try! doc.document.data(as: MsgModel.self)!
                    
                    DispatchQueue.main.async {
                        self.noUserss=false
//                        self.messages.append(msg)
                    }
                }
            }
        }
    }
    
    func readAllUses(){
        var xx = [UserModel]()
        
        ref.collection("Users").getDocuments { (doc, err) in
            
            if err != nil{
                print(err!.localizedDescription)
                self.noUserss=true
                return
            }
            
            guard let data = doc else{
                self.noUserss = true
                return

            }

            if data.documentChanges.isEmpty{

                self.noUserss = true
                return
            }

            
//            guard let user = doc else{return}
            
            
            data.documentChanges.forEach { (doc) in
                
                // Checking If Doc Added...
                if doc.type == .added{
                  
                    let username = doc.document.data()["username"] as! String
                    let pic = doc.document.data()["imageurl"] as! String
                    let bio = doc.document.data()["bio"] as! String
                    let uid = doc.document.documentID
                    
//                    let user = UserModel(username: username, pic: pic, bio: bio, id: uid)
//                    
//                    xx.append(user)
                    
                    
                }
               
            }
            
            DispatchQueue.main.async {
                self.users=xx
                self.filtered=xx
            }
        }
        
        
    }
  
    
    func makeSearch(txt:String) ->[MsgModel] {
        
        // filterting Data...
        if txt != ""{
            return []
//           return messages.filter{$0.user.lowercased().contains(txt.lowercased())}
        }
        else{
            return []
//            return messages
        }
    }
        }

