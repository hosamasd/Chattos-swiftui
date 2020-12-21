//
//  SecondRegisterViewModel.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI
import Firebase

class SecondRegisterViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var bio = ""
    
    @Published var image_Data = Data(count: 0)
    @Published var picker = false
    
    let ref = Firestore.firestore()

    // Loading View...
    @Published var isLoading = false
    @AppStorage("current_status") var status = false
    @AppStorage("after_log_signuup") var logOrSignup = false
    @AppStorage("log_Status") var logins = false
    
    
    func register(){
        
        isLoading = true
       
        // setting User Data To Firestore....
        
                let uid = Auth.auth().currentUser!.uid
        
                UploadImage(imageData: image_Data, path: "profile_Photos") { (url) in
        
                    self.ref.collection("Users").document(uid).setData([
        
                        "uid": uid,
                        "pic": url,
                        "username": self.name,
                        "bio": self.bio,
//                        "dateCreated": Date()
        
                    ]) { (err) in
        
                        if err != nil{
                            self.isLoading = false
                            return
                        }
                        self.isLoading = false
                        // success means settings status as true...
                        self.status = true
                        self.logOrSignup=true
                        self.logins=true
                    }
                }
        
        self.name = ""
        self.bio = ""
        self.image_Data = Data(count: 0)
        self.picker = false
        
        // success means settings status as true...
//        self.status = true
       
    }
    
    
}

