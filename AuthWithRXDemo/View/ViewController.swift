//
//  ViewController.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import UIKit
import RxSwift
import SVProgressHUD
import Firebase
import FirebaseFirestore
class ViewController: UIViewController {
   // let bag = DisposeBag()
    
    @IBOutlet weak var UserTable: UITableView!
    private let bag = DisposeBag()
    var viewModel = UserListViewModel()
    fileprivate var user = [User]()
    
    var docref : DocumentReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        docref = Firestore.firestore().document("Auth/item")
        viewModel.viewDelegate = self
        setup()
        bindview()
        loadUser()
        // Do any additional setup after loading the view.
    }

    private func setup()
    {
        UserTable.delegate = self
        UserTable.dataSource = self
        
    }
    
    private func bindview()
    {
        viewModel.userObservable.subscribe(onNext: { [weak self] user in
            self?.user = user
           
            
           // let dataToSave : [String: Any] = ["name": name, "profession": profession]
//            docref.setData(self?.user ?? default value) { (error) in
//
//                if let error = error
//                {
//                    print("error")
//                }
//                else{
//                    print("data save")
//
//                }
//
//
//            }
            self!.UserTable.reloadData()
            
        })
        .disposed(by: bag)
      
        
        }
    
    
    private func loadUser()
    {
        viewModel.showonlineuser()
        
    }
    
    @IBAction func didClickOnLogoutButton(_ sender: Any)
   {
        viewModel.logoutUser()
    
   }
    
        
    }

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("\(self.user)")
        print("\(self.user.count)")
        return self.user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as? UserListTableViewCell {
            
            let user1 = user[indexPath.row]
            cell.setUpView(user: user1)
            return cell
        }
        return UITableViewCell()
    }
    
    

    
    
    
    
    
    
    
}
    
extension ViewController: UserListViewModelViewDelegate {
    
    
    func didUserListLoaded()
    {
        
    }
    func didUserListLoadFailed()
    {
        
    }
    func didLogoutSuccessfully()
    {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "Userlogout Successfully",message: "" ,preferredStyle: .alert )
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] action in
            
            alert.dismiss(animated: true, completion: nil)
            self?.viewModel.showUserLoginView()
            
            
        })
        present(alert, animated: true)
        
        
//        alert.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self] action in
//            alert.dismiss(animated: true, completion: nil)
//            self?.viewModel?.showUserLoginView()
//        })
//        present(alert, animated: true)
        
    }
    
    
    func didLogutFailed()
    {
        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "User Logot Fail",message: "" ,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default){ [weak self] action in
            alert.dismiss(animated: true,completion: nil)
           // self?.viewModel?.sh
            
            
            
        })
        present(alert, animated: true)
        
        
        
    }
    
    
}



