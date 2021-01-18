

import Foundation

protocol UserLoginCoordinatorDelegate: class {
    func didCompleteUserLogin()
    func showUserSignupView()
}

protocol UserSignupCoordinatorDelegate: class {
    func didCompleteUseSignup()
    func showLogin()
}

protocol UserListCoordinatorDelegate: class {
    func showLoginViewAfterLogout()
}
