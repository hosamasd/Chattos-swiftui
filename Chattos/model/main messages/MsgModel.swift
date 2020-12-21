//
//  Msg.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct MsgModel : Codable,Identifiable,Hashable {

    @DocumentID var id : String?
    var msg : String
    var user : String
    var timeStamp: Date
    
    enum CodingKeys: String,CodingKey {
        case id
        case msg
        case user
        case timeStamp
    }

}

struct MessageModel:Hashable,Identifiable {
    @DocumentID var id : String?
    let text,fromId,toId,imageUrl,videoUrl,autoId:String
    let timestamp:Double
    let isFromCurrentUser:Bool
     var width,height:Double?
    
    func checkPartnerId() -> String? {
        return  fromId == Auth.auth().currentUser?.uid ?   toId :   fromId
    }
    init(dict: [String:Any]) {
        self.text = dict["text"] as? String ?? ""
        self.fromId = dict["fromId"] as? String ?? ""
        self.toId = dict["toId"] as? String ?? ""
        self.videoUrl = dict["videoUrl"] as? String ?? ""
        self.imageUrl = dict["imageUrl"] as? String ?? ""
         self.autoId = dict["autoId"] as? String ?? ""
        self.timestamp = dict["timestamp"] as? Double ?? 0.0
        self.width = dict["width"] as? Double
        self.height = dict["height"] as? Double
        
        self.isFromCurrentUser = UserServices.shared.currentUserId == fromId
    }
}

