//
//  Msg.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI
import FirebaseFirestoreSwift

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

struct MsgTwos : Identifiable,Hashable {
    var id = UUID().uuidString

//    var id : Int
    var name : String
    var msg : String
    var date : String
    var img : String
}

//var data = [
//
//    MsgModel(name: "Emily", msg: "Hello!!!", date: "25/03/20",img: "person.circle"),
//    MsgModel(name: "Jonh", msg: "How Are You ???", date: "22/03/20",img: "person.circle.fill"),
//    MsgModel( name: "Catherine", msg: "New Tutorial From Kavsoft", date: "20/03/20",img: "person.crop.square.fill"),
//    MsgModel( name: "Emma", msg: "Hey Everyone", date: "25/03/20",img: "person.and.arrow.left.and.arrow.right"),
//    MsgModel(name: "Lina", msg: "SwiftUI Tutorials", date: "25/03/20",img: "person.2.circle"),
//    MsgModel( name: "Steve Jobs", msg: "New Apple iPhone", date: "15/03/20",img: "person.crop.circle.fill.badge.plus"),
//    MsgModel( name: "Roy", msg: "Hey Guys!!!", date: "25/03/20",img: "person.crop.circle.badge.plus"),
//    MsgModel( name: "Julia", msg: "Hello!!!", date: "25/03/20",img: "person.crop.circle"),
//    MsgModel( name: "Watson", msg: "How Are You ???", date: "22/03/20",img: "person.2.circle.fill"),
//    MsgModel( name: "Kavuya", msg: "New Tutorial From Kavsoft", date: "20/03/20",img: "person.crop.square.fill"),
////    Msg(id: 10, name: "Julie", msg: "Hey Everyone", date: "25/03/20",img: "person.crop.circle.fill.badge.xmark"),
////    Msg(id: 11, name: "Lisa", msg: "SwiftUI Tutorials", date: "25/03/20",img: "person.crop.circle.badge.questionmark"),
//
//]
