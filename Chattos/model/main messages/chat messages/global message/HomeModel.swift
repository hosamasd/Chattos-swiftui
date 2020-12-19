//
//  HomeModel.swift
//  Global Chat
//
//  Created by Balaji on 12/09/20.
//

import SwiftUI
//import Firebase

class HomeModel: ObservableObject{
    
    @Published var txt = ""
    @Published var msgs : [MsgModel] = []
    @AppStorage("current_user") var user = ""
//    let ref = Firestore.firestore()
    
    init() {
        readAllMsgs()
    }
    
    func onAppear(){
        
        // Checking whether user is joined already....
        
        if user == ""{
            // Join Alert...
            
            UIApplication.shared.windows.first?.rootViewController?.present(alertView(), animated: true)
        }
    }
    
    func alertView()->UIAlertController{
        
        let alert = UIAlertController(title: "Join Chat !!!", message: "Enter Nick Name", preferredStyle: .alert)
        
        alert.addTextField { (txt) in
            txt.placeholder = "eg Kavsoft"
        }
        
        let join = UIAlertAction(title: "Join", style: .default) { (_) in
            
            // checking for empty click...
            
            let user = alert.textFields![0].text ?? ""
            
            if user != ""{
                
                self.user = user
                return
            }
            
            // repromiting alert view...
            
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        }
        
        alert.addAction(join)
        
        return alert
    }
    
    func readAllMsgs(){
        
        self.msgs.append(MsgModel(msg: "hello and welcome", user: "s", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and bye", user: "ss", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and ssfsd", user: "s", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and sdfdsf", user: "ss", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and welcome self.msgs.append(MsgModel(msg: hello and welcome, user: ss, timeStamp: Date()))", user: "ss", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and welcom xdvxcve", user: "s", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and welcom  dsgdgve", user: "ss", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hee", user: "ss", timeStamp: Date()))
        self.msgs.append(MsgModel(msg: "hello and ", user: "ss", timeStamp: Date()))
        
//        ref.collection("Msgs").order(by: "timeStamp", descending: false).addSnapshotListener { (snap, err) in
//
//            if err != nil{
//                print(err!.localizedDescription)
//                return
//            }
//
//            guard let data = snap else{return}
//
//            data.documentChanges.forEach { (doc) in
//
//                // adding when data is added...
//
//                if doc.type == .added{
//
//                    let msg = try! doc.document.data(as: MsgModel.self)!
//
//                    DispatchQueue.main.async {
//                        self.msgs.append(msg)
//                    }
//                }
//            }
//        }
    }
    
    func writeMsg(){
        
        let msg = MsgModel(msg: txt, user: "s", timeStamp: Date())
        self.msgs.append(msg)
//        let msg = MsgModel(msg: txt, user: user, timeStamp: Date())

//        let _ = try! ref.collection("Msgs").addDocument(from: msg) { (err) in
//            
//            if err != nil{
//                print(err!.localizedDescription)
//                return
//            }
// 
//        }
        
        self.txt = ""
    }
}


