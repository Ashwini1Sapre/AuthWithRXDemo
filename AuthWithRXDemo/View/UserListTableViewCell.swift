//
//  UserListTableViewCell.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 19/01/21.
//


import UIKit

class UserListTableViewCell: UITableViewCell
{
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?
    
    func setUpView(user: User)
    {
        self.user = user
        guard let view = view, let nameLabel = nameLabel else {return}
        view.layer.cornerRadius = 20
        nameLabel.text = user.name
        
        
    }
    
    
    
//    func setupView(user: User) {
//        self.user = user
//
//        guard let view = view, let nameLabel = nameLabel else {return}
//
//        view.layer.cornerRadius = 10
//        nameLabel.text = user.name
//    }
    
}
