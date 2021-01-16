//
//  UserLoginViewModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import Foundation
class UserLoginViewModel: NSObject
{
    weak var viewDelwgate: UserLoginViewModelViewDelegate?
    weak var coordinateDelegate: UserLoginViewModelCoordinatorDelegate?
    
    
    var model: UserModel?
    var userEmail: String?
    var password: String?
    
    
    func loginUser()
    {
        model?.loginUserWith(email: userEmail!, password: password!) { [weak self] didLogin in
            if didLogin == true
            {
                self?.viewDelwgate?.didCompleteUserLogin()
                
            }
            else{
                self?.viewDelwgate?.didUserLoginFail()
                
            }
            
            
            
        }
        
        
    }
    
    
    func showUserSignupView() {
        coordinateDelegate?.showUserSignupView()
    }
    
    func showUserListView() {
        coordinateDelegate?.didCompleteUserLogin()
    }
}
