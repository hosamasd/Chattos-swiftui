//
//  UserServices.swift
//  Chattos
//
//  Created by hosam on 20/12/2020.
//

import UIKit
import Firebase

class UserServices {
    static let shared = UserServices()
    
    var currentUserId: String {
        return Auth.auth().currentUser != nil ? Auth.auth().currentUser!.uid : ""
}

    func getAllUsers(completion: @escaping (UserModel?,Error?)->())  {
//        ref.reference(withPath: "Users").observe(.childAdded) { (snapshot) in
//            let uid = snapshot.key
//            self.getUserData(uid: uid, completion: completion)
//        }
    }
    
     func getUserData(uid:String,completion: @escaping (UserModel?,Error?)->())  {
//        ref.reference(withPath: "Users").child(uid).observe(.value) { (snapshot) in
//            if let dict = snapshot.value as? [String:Any]{
//                let user = UserModel(dict: dict)
//                completion(user,nil)
//            }
//        }
    }
    
    func getCuurentData(uid:String,completion: @escaping (UserModel)->())  {
//        ref.reference(withPath: "Users").child(uid).observe(.value) { (snapshot) in
//            if let dict = snapshot.value as? [String:Any]{
//                let user = UserModel(dict: dict)
//                completion(user)
//            }
//        }
    }
    
    func isOnline(state:Bool)  {
        let uid = UserServices.shared.currentUserId
        
//        if !uid.isEmpty {
//            let ref = ref.reference(withPath: "Users").child(uid).child("isOnline")
//            let values:[String:Any] = ["online":state,
//                                       "latest":Date().timeIntervalSince1970]
//            ref.updateChildValues(values)
//        }
    }
    
}
