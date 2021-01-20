//
//  File.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 20/01/21.
//

import Foundation
import FirebaseFirestoreSwift


struct User1 : Identifiable, Codable {
   // var id: ObjectIdentifier
    
   // var id: ObjectIdentifier
    

    @DocumentID var id: String?
    var name: String
    var pos: String
    
    
    enum codingkeys : String, CodingKey
    {
        case id
        case name
        case pos
        
        
    }
    
    
}
