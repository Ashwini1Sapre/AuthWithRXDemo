//
//  UserSignupViewModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import Foundation
class UserSignupViewModel: NSObject {
    
    weak var viewDelegate: UserSignupViewModelViewDelegate?
    weak var coordinatorDelegate: UserSignupViewModelCoordinatorDelegate?
    
    var model: UserModel?
    var userName: String?
    var userEmail: String?
    var password: String?
    
    func showUserLoginView() {
        coordinatorDelegate?.showUserLoginView()
    }
    
    func signupUser() {
        model?.signupUserWith(name: userName!, email: userEmail!, password: password!) { [weak self] didSignup in
            if didSignup == true {
                self?.viewDelegate?.didCompleteUserSignup()
            } else {
                self?.viewDelegate?.didUserSignupFail()
            }
        }
    }
}
    
    


