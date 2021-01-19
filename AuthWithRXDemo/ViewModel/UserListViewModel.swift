//
//  UserListViewModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 19/01/21.
//

import Foundation
import RxSwift
class UserListViewModel: NSObject
{
    
    var model = ChatRoomModel()
    
    weak var viewDelegate: UserListViewModelViewDelegate?
    weak var coordinate: UserListViewModelCoordinatorDelegate?
    
    
    
    var userObservable: Observable<[User]>
    {
        return self.model.onlineUser.asObserver()
        
    }
    
    
    func logoutUser()
    {
        UserModel.sharedInstance.logoutUser { [weak self] didlogout in
            
            if didlogout == true
            {
                
                self?.viewDelegate?.didLogoutSuccessfully()
            }
            else
            {
                self?.viewDelegate?.didLogutFailed()
            }
            
            
        }
        
        
        
    }
    
    
    func showonlineuser()
    {
        model.getOnlineUserLiset()
        
    }
    
    
    func showUserLoginView()
    {
        
        coordinate?.showUserLoginView()
    }
    
    
}
