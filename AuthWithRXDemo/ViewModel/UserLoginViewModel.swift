//
//  UserLoginViewModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import Foundation


class UserLoginViewModel: NSObject {
    
    weak var viewDelegate: UserLoginViewModelViewDelegate?
    weak var coordinatorDelegate: UserLoginViewModelCoordinatorDelegate?
    
    var model: UserModel?
    var userEmail: String?
    var userPassword: String?
    
    func loginUser() {
        model?.loginUserWith(email: userEmail!, password: userPassword!) { [weak self] didLogin in
            if didLogin == true {
                self?.viewDelegate?.didCompleteUserLogin()
            } else {
                self?.viewDelegate?.didUserLoginFail()
            }
        }
    }
    
    func showUserSignupView() {
        coordinatorDelegate?.showUserSignupView()
    }
    
    func showUserListView() {
        coordinatorDelegate?.didCompleteUserLogin()
    }
}
