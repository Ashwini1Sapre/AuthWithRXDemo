//
//  Home.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 20/01/21.
//

import Foundation
import UIKit
import FirebaseFirestore

class Home: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextFieild: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var docref : DocumentReference!
    
    var viewmodel : UserViewModel?
    //@Published var USERlist: Use
    private var db = Firestore.firestore()
    override func viewDidLoad() {
        
        docref = Firestore.firestore().document("Auth/Item")
        
    }

    

    

    
    func fetchData(){
        
        docref.getDocument { (snapshot, error) in
            
            guard let snapshot = snapshot , snapshot.exists else
            { return }
            
            let data  = snapshot.data()
            let name = data? ["name"] as? String ?? ""
            let email = data? ["email"] as? String ?? ""
            
          print("\(name) have email \(email)")
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    @IBAction  func AddButton(_ sender: Any)
    {
        
        self.viewmodel?.handelDoneTapped()
        guard let name = nameTextFieild.text , !name.isEmpty else {
            return
        }
        
        guard let email = emailTextField.text , !email.isEmpty else {
            return
        }
        
        let datasave : [String: Any] = ["name" : name , "email" : email]
        docref.setData(datasave) { (error) in
            if error != nil
            {
                print("error")
            }
            else
            {
                print("Save")
                
                
                let alert = UIAlertController(title: "Add Succesfully", message: "", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] action in
        
          //  self?.fetchData()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let app = UIApplication.shared.delegate as! AppDelegate
            let  viewpass = storyboard.instantiateViewController(identifier: "ViewController") as!
                ViewController
            app.window!.rootViewController = viewpass
            
       // alert.dismiss(animated: true, completion: nil)
                    
                    
                })
                self.present(alert, animated: true)
            
            }
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
}




















extension Home: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
