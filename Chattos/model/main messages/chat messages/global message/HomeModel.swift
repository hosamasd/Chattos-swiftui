//
//  HomeModel.swift
//  Global Chat
//
//  Created by Balaji on 12/09/20.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject{
    
    @Published var txt = ""
    @Published var msgs : [MsgModel] = []
//    @AppStorage("current_user") var user = ""
    let ref = Firestore.firestore()
    
    
    func readAllMsgs(_ target: UserModel){
        
//        self.msgs.append(MsgModel(msg: "hello and welcome", user: "s", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and bye", user: "ss", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and ssfsd", user: "s", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and sdfdsf", user: "ss", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and welcome self.msgs.append(MsgModel(msg: hello and welcome, user: ss, timeStamp: Date()))", user: "ss", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and welcom xdvxcve", user: "s", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and welcom  dsgdgve", user: "ss", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hee", user: "ss", timeStamp: Date()))
//        self.msgs.append(MsgModel(msg: "hello and ", user: "ss", timeStamp: Date()))
        
        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in

            if err != nil{
                print(err!.localizedDescription)
                return
            }

            guard let data = snap else{return}

            data.documentChanges.forEach { (doc) in

                // adding when data is added...

                if doc.type == .added{

                    let msg = try! doc.document.data(as: MsgModel.self)!

                    DispatchQueue.main.async {
                        self.msgs.append(msg)
                    }
                }
            }
        }
    }
    
    func writeMsg(targetUser:UserModel,currentUser:UserModel){
//        var value : []
        
//        let refsss =  ref.collection("Messages").collection(currentUser.id).collection(targetUser.id)
//        let refTo = collection("Messages").collection(targetUser.id).collection(currentUser.id)
//        
//        let auto = refsss.document()
//        let key = key.documentID
//        
//        var dd = [key:"1"]
//        
//        var dict = value
//        dict["autoId"] = key
//        if let text = dict["text"] as? String, text.isEmpty {
//            dict["imageUrl"] = nil
//            dict["height"] = nil
//            dict["width"] = nil
//        }
//        auto.updateChildValues(dd)
//        refTo.updateChildValues(dd)
//        
//        
//        let ref = ref.child("Messages").child(currentUser.id).child(targetUser.id)
//        let auto =   ref.childByAutoId()
//        guard let key = auto.key else { return  }
//        let refTo = Database.database().reference().child("Messages").child(toId).child(fromId).child(key)
//        var dd = [key:"1"]
//        
//        var dict = value
//        dict["autoId"] = key
//        if let text = dict["text"] as? String, text.isEmpty {
//            dict["imageUrl"] = nil
//            dict["height"] = nil
//            dict["width"] = nil
//        }
//        auto.updateChildValues(dd)
//        refTo.updateChildValues(dd)
//        
//        
//        
//        Database.database().reference().child("Inbox").child(key).updateChildValues(dict)
//        
////        let msg = MsgModel(msg: txt, user: "s", timeStamp: Date())
////        self.msgs.append(msg)
//        
////        let msg = MsgModel(msg: txt, user: user.username, timeStamp: Date())
////
////        let _ = try! ref.collection("Msgs").addDocument(from: msg) { (err) in
////            
////            if err != nil{
////                print(err!.localizedDescription)
////                return
////            }
//// 
////        }
//        
//        self.txt = ""
    }
}


