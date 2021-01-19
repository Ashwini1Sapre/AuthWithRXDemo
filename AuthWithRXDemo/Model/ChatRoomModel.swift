//
//  ChatRoomModel.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 19/01/21.
//

import Foundation
import RxSwift
class ChatRoomModel: NSObject
{
    var onlineUser = PublishSubject<[User]>()
    func getOnlineUserLiset()
    {
        
        UserModel.sharedInstance.getLoggedinUserList { [weak self] user in
            if user.count > 0
            {
                
                self?.onlineUser.onNext(user)
            }
            
            
        }
        
        
    }
    
    
    
}
