

import Foundation

class User: NSObject {
    
    var name: String!
    var email: String!
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
