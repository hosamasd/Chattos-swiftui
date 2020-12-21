//
//  UserModel.swift
//  Social App
//
//  Created by Balaji on 15/09/20.
//

import SwiftUI

struct UserModellllllllll:Identifiable {
    var username : String
    var pic : String
    var bio: String
    var id: String

}

struct UserModel: Identifiable {
    var username : String
    var pic : String
    var bio: String
    var id: String

    init(dict: [String:Any]) {
//        self.email = dict["email"] as? String ?? ""
        self.bio = dict["bio"] as? String ?? ""
        self.id = dict["uid"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
        self.pic = dict["pic"] as? String ?? ""
//        let isonline = dict["isOnline"] as? [String:Any]
//
//        self.online = isonline?["online"] as? Bool ?? false
    }
    
    init(uid: String, username: String, pic: String,bio:String) {
        self.id = uid
        self.username = username
        self.pic = pic
        self.bio=bio
    }
}
