

import Foundation

import FirebaseFirestoreSwift

class User: NSObject {
    
    
    @DocumentID var id: String!
    var name: String!
    var email: String!

    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case email
        
        
        
    }
}
