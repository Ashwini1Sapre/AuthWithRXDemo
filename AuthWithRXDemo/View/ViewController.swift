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
    var window: UIWindow!
    weak var delegate: UserSignupCoordinatorDelegate?
    var viewModel1: UserViewModel?
    var viewModel2: UsersViewModels?
    var viewmodelnew = UserViewModel()
   var viewModelold = UserViewModel()
    var docref : DocumentReference!
    private var db = Firestore.firestore()
    var array : [String] = []
  // var varrr : User1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        docref = Firestore.firestore().document("Auth/Item")
        viewModel.viewDelegate = self
        setup()
        
        fetchData()
        
        
        db.collection("Auth").getDocuments { (snapshot,error) in
            if error != nil{
                
                print("\(String(describing: error))")
                
                
            }
            else
            {
                for document in (snapshot?.documents)! {
                    
                    if let name = document.data()["name"] as? String {
                        
                        self.array.append(name)
                        self.UserTable.reloadData()
                        
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        bindview()
        loadUser()
        
        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func fetchData()
    {
        docref.getDocument { (snapshot,error) in
            
            guard let snapshot = snapshot , snapshot.exists else { return }
            
            let data = snapshot.data()
            
            let name = data?["name"] as? String ?? ""
            let email = data?["email"] as? String ?? ""
            
            print("\(name) have \(email)")
            
            
            
           // print("\(User())")
            var logguser = [User]()
            logguser.append(User(name: name, email: email))
           // logguser.append(User(name: "Tom", email: "tom@gmail.com"))
           // logguser.append(User(name: "swan", email: "s@gmail.com"))
            
            
            self.user = logguser
            print("adddd listt,\(String(describing: self.viewModel2?.userlists))")
            self.viewModel2?.subscribe()
        
            
           // self.viewModel1?.handelDoneTapped()
          // self.viewModel2?.subscribe()
            self.UserTable.reloadData()
        }
        
        
        
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
            
            print("\(String(describing: self?.user))")
           self!.UserTable.reloadData()
            
        })
        .disposed(by: bag)
      
        
        }
    
    
    private func loadUser()
    {
        viewModel.showonlineuser()
        
    }
    
    @IBAction func didClickOnAdd(_ sender: Any)
    {
    
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let appp = UIApplication.shared.delegate as! AppDelegate
        let signupVC = storyboard.instantiateViewController(withIdentifier: "Home") as! Home
    
        appp.window!.rootViewController = signupVC
        
        
    }
    
    @IBAction func didClickOnLogoutButton(_ sender: Any)
   {
        viewModel.logoutUser()
    
   }
    
        
    }

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func handelDelete()
    {
       
      //  db.collection("Auth").document(viewModel1.userlist.id).delete()
        
        viewModelold.handelDeleteTapped()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print("\(self.user)")
        print("\(self.user.count)")
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as? UserListTableViewCell {
            
            let user1 = array[indexPath.row]
          //  cell.setUpView(user: user1)
            
            cell.nameLabel.text = user1
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
       // db.collection("Auth").
        
       // viewModel2?.removeItem(atoffsets: indexPath)
        
        
        viewmodelnew.handelDeleteTapped()
        
        handelDelete()
        db.collection("Auth").document("Item").delete()
        
      //  db.collection("Auth").document(viewmodelnew.userlist.id ?? "sagar").delete()
        
        db.collection("Auth").document(viewmodelnew.userlist.id ?? "sagar").delete() { (error) in
            
            if let error = error{
                
                print(error.localizedDescription)
                
            }
            
            
            
        }

        array.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        
        
        
    }
    
    
    
    
    
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
    
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
        
        

        
    }
    
    
    func didLogutFailed()
    {
        SVProgressHUD.dismiss()
        let alert = UIAlertController(title: "User Logout Fail",message: "" ,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",style: .default){ [weak self] action in
            alert.dismiss(animated: true,completion: nil)
          
            
            
            
        })
        present(alert, animated: true)
        
        
        
    }
    
    
}



