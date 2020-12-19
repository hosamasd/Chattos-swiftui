//
//  Msg.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct Msg : Identifiable,Hashable {
    var id = UUID().uuidString

//    var id : Int
    var name : String
    var msg : String
    var date : String
    var img : String
}

var data = [
    
    Msg(name: "Emily", msg: "Hello!!!", date: "25/03/20",img: "person.circle"),
    Msg(name: "Jonh", msg: "How Are You ???", date: "22/03/20",img: "person.circle.fill"),
    Msg( name: "Catherine", msg: "New Tutorial From Kavsoft", date: "20/03/20",img: "p3"),
    Msg( name: "Emma", msg: "Hey Everyone", date: "25/03/20",img: "person.and.arrow.left.and.arrow.right"),
    Msg(name: "Lina", msg: "SwiftUI Tutorials", date: "25/03/20",img: "person.2.circle"),
    Msg( name: "Steve Jobs", msg: "New Apple iPhone", date: "15/03/20",img: "person.crop.circle.fill.badge.plus"),
    Msg( name: "Roy", msg: "Hey Guys!!!", date: "25/03/20",img: "person.crop.circle.badge.plus"),
    Msg( name: "Julia", msg: "Hello!!!", date: "25/03/20",img: "person.crop.circle"),
    Msg( name: "Watson", msg: "How Are You ???", date: "22/03/20",img: "person.2.circle.fill"),
    Msg( name: "Kavuya", msg: "New Tutorial From Kavsoft", date: "20/03/20",img: "person.crop.square.fill"),
//    Msg(id: 10, name: "Julie", msg: "Hey Everyone", date: "25/03/20",img: "person.crop.circle.fill.badge.xmark"),
//    Msg(id: 11, name: "Lisa", msg: "SwiftUI Tutorials", date: "25/03/20",img: "person.crop.circle.badge.questionmark"),
    
]
