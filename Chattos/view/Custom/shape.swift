//
//  shape.swift
//  Chattos
//
//  Created by hosam on 19/12/2020.
//

import SwiftUI

struct shape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 30, height: 30))
        
        return Path(path.cgPath)
    }
}
