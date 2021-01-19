

import Foundation


class UserLoginViewModel: NSObject {
    
    weak var viewDelegate: UserLoginViewModelViewDelegate?
  //  weak var viewdelegate1: UserListViewModelViewDelegate?
    weak var coordinatorDelegate: UserLoginViewModelCoordinatorDelegate?
   // weak var coordinatorDelegate1: UserListViewModelCoordinatorDelegate?
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
    
    
//    func logoutUser() {
//        UserModel.sharedInstance.logoutUser { [weak self] didLogOut in
//            if didLogOut == true {
//                self?.viewdelegate1?.didLogoutSuccessfully()
//            } else {
//                self?.viewdelegate1?.didLogutFailed()
//            }
//        }
//    }
    
//    func showUserLoginView() {
//        coordinatorDelegate1?.showUserLoginView()
//    }
    
    
}
