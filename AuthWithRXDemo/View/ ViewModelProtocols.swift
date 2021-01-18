

import Foundation

protocol UserLoginViewModelViewDelegate: class {
    func didCompleteUserLogin()
    func didUserLoginFail()
}

protocol UserLoginViewModelCoordinatorDelegate: class {
    func didCompleteUserLogin()
    func showUserSignupView()
}

protocol UserSignupViewModelViewDelegate: class {
    func didCompleteUserSignup()
    func didUserSignupFail()
}

protocol UserSignupViewModelCoordinatorDelegate: class {
    func showUserLoginView()
}

protocol UserListViewModelViewDelegate: class {
    func didUserListLoaded()
    func didUserListLoadFailed()
    func didLogoutSuccessfully()
    func didLogutFailed()
}

protocol UserListViewModelCoordinatorDelegate: class {
    func showUserLoginView()
}
