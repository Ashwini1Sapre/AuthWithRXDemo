//
//  UserModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import Foundation
class UserModel: NSObject
{
    static var sharedInstance = UserModel()
    
    
    override private init() {
        
    }
    
    
    var user: User?
    {
        get{
            
            return UserService.sharedInstance.user
        }
        
    }
    
    
    
    func loginUserWith(email: String, password: String, completionHandler: @escaping (_:Bool) -> Void) {
        UserService.sharedInstance.loginUserWith(email: email, password: password) { didLogin, user in
            completionHandler(didLogin)
        }
    }
    
    func signupUserWith(name: String, email: String, password: String, completionHandler: @escaping (_:Bool) -> Void) {
        UserService.sharedInstance.signupUserWith(name: name, email: email, password: password) { didSignup in
            completionHandler(didSignup)
        }
    }
    
}
