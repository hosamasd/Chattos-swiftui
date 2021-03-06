//
//  SettingsViewModel.swift
//  Social App
//
//  Created by Balaji on 15/09/20.
//

import SwiftUI
import Firebase

class SettingsViewModel : ObservableObject{
    
    @Published var userInfo = UserModel(uid: "", username: "", pic: "", bio: "")
//    @Published var userInfo = UserModel(username: "hosam mohamed", pic: "", bio: "ios developer", uid: "")
    //status for register
    @AppStorage("current_status") var status = false
    @AppStorage("log_Status") var logins = false
    @AppStorage("after_log_signuup") var logOrSignup = false
    @AppStorage("change_user_profile") var isNewUrl = false
    @AppStorage("url_new_user_profile") var newUrl = ""

    // Image Picker For Updating Image...
    @Published var picker = false
    @Published var img_data = Data(count: 0)
    
    // Loading View..
    @Published var isLoading = false
    
    
    
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {

        fetchUser(uid: uid) { (user) in
            self.userInfo = user
        }
    }
//
//
    func logOut(){
//
//        // logging out..
//
        try! Auth.auth().signOut()
        status = false
        logOrSignup=false
        logins=false
        self.isNewUrl=false
        self.newUrl=""
    }
//
    func updateImage(){
//
        isLoading = true
//
        UploadImage(imageData: img_data, path: "profile_Photos") { (url) in
//
            self.ref.collection("Users").document(self.uid).updateData([

                "pic": url,
            ]) { (err) in
                if err != nil{return}

                // Updating View..
                self.isLoading = false
                fetchUser(uid: self.uid) { (user) in
                    self.userInfo = user
                    self.isNewUrl=true
                    self.newUrl = url
                }
            }
        }
    }
//
    func updateDetails(field : String){
//
        alertView(msg: "Update \(field)") { (txt) in

            if txt != ""{

                self.updateBio(id: field == "Name" ? "username" : "bio", value: txt)
            }
        }
    }
//
    func updateBio(id: String,value: String){
//
        ref.collection("Users").document(uid).updateData([

            id: value,
        ]) { (err) in

            if err != nil{return}

            // refreshing View...

            fetchUser(uid: self.uid) { (user) in
                self.userInfo = user
            }
        }
    }
}
