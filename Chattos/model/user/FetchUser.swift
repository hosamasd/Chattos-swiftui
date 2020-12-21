//
//  FetchUser.swift
//  Social App
//
//  Created by Balaji on 16/09/20.
//

import SwiftUI
import Firebase

// Global Refernce

let ref = Firestore.firestore()

func fetchUser(uid: String,completion: @escaping (UserModel) -> Void){
    
    ref.collection("Users").document(uid).getDocument { (doc, err) in
        guard let user = doc else{return}
        
        guard let dict = user.data() else{return}
        
//        let username = user.data()?["username"] as! String
//        let pic = user.data()?["imageurl"] as! String
//        let bio = user.data()?["bio"] as! String
//        let uid = user.documentID
        
        DispatchQueue.main.async {
            completion(UserModel(dict:dict ))
        }
    }
}

func fetchAllUsers(completion: @escaping ([UserModel]) -> Void){
    var xx = [UserModel]()
    
    ref.collection("Users").getDocuments { (doc, err) in
        guard let user = doc else{return}
        
        
        user.documentChanges.forEach { (doc) in
            
            // Checking If Doc Added...
            if doc.type == .added{
              
                 let dict = doc.document.data() 

                
//                let username = doc.document.data()["username"] as! String
//                let pic = doc.document.data()["imageurl"] as! String
//                let bio = doc.document.data()["bio"] as! String
//                let uid = doc.document.documentID
                
                let user = UserModel(dict: dict)
                
                xx.append(user)
                
                
            }
            DispatchQueue.main.async {
                completion(xx)
            }
        }
    }
}
