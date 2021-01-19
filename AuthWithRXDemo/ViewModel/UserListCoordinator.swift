//
//  UserHomeCoordinator.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 19/01/21.
//

import UIKit

class UserListCoordinator: Coordinator
{
    
    
    
    var window: UIWindow?
    weak var delegate: UserListCoordinatorDelegate?
    
    
    init(withWindow: UIWindow) {
        self.window = withWindow
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let userHomwView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        let userHomeViewModel = UserListViewModel()
        userHomeViewModel.coordinate = self
        userHomeViewModel.model = ChatRoomModel()
        userHomwView.viewModel = userHomeViewModel
        self.window?.rootViewController = userHomwView
        
    
    }
    
}



extension UserListCoordinator: UserListViewModelCoordinatorDelegate {
    
    func showUserLoginView()
    {
        delegate?.showLoginViewAfterLogout()
    }
    

}












