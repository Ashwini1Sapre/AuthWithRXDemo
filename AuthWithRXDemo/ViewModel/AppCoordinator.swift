

import UIKit

class AppCoordinator: Coordinator {
    
    var coordinators = [CoordinatorId:Coordinator]()
    var window: UIWindow!
    
    init(withWindow: UIWindow) {
        window = withWindow
    }
    
    func start() {
        if ApplicationModel.sharedInstanse.isUserLoggedIn() {
            showUserListView()
        } else {
            showUserLoginView()
        }
    }
}

extension AppCoordinator: UserLoginCoordinatorDelegate {
    
    func showUserLoginView() {
        let userLoginCoordinator = UserLoginCoordinator(withWindow: window)
        coordinators[.userLogin] = userLoginCoordinator
        userLoginCoordinator.delegate = self
        userLoginCoordinator.start()
    }
    
    func showUserSignupView() {
        let userSignupCoordinator = UserSignupCoordinator(withWindow: window)
        coordinators[.userSignup] = userSignupCoordinator
        userSignupCoordinator.delegate = self
        userSignupCoordinator.start()
    }
    
    func showUserHOmeView() {
        let userHomeCoordinator = UserLoginCoordinator(withWindow: window)
        coordinators[.Home] = userHomeCoordinator
        userHomeCoordinator.delegate = self
        userHomeCoordinator.start()
    }
    
    
func showUserListView()
{
    let userListCoordinator = UserListCoordinator(withWindow: window)
    coordinators[.userList] = userListCoordinator
    userListCoordinator.delegate = self
    userListCoordinator.start()
    
    
}
   
    func didCompleteUserLogin() {
        coordinators[.userLogin] = nil
        showUserListView()
    }
    
   
}

extension AppCoordinator: UserSignupCoordinatorDelegate {
    func didCompleteUseSignup() {
        coordinators[.userSignup] = nil
        showUserLoginView()
    }
    
    func showLogin() {
        coordinators[.userSignup] = nil
        showUserLoginView()
    }
}

extension AppCoordinator: UserListCoordinatorDelegate {
    func showLoginViewAfterLogout() {
       // coordinators[.usersList] = nil
        showUserLoginView()
    }
}
