//
//  UserLoginVC.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import SVProgressHUD
import RxSwift
import RxCocoa
import UIKit

class UserLoginVC: UIViewController {

    let bag = DisposeBag()
    var viewModel:UserLoginViewModel?
    var window: UIWindow!
    weak var delegate: UserSignupCoordinatorDelegate?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // viewModel?.viewDelegate = self
        viewModel?.viewDelegate = self
        
        setupView()
        bindView()
    }
    
    func setupView() {
        emailTextField.delegate = self
        emailTextField.returnKeyType = .done
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true
        
        loginButton.layer.cornerRadius = 15
        loginButton.isUserInteractionEnabled = false
        loginButton.alpha = 0.6
    }
    
    func bindView() {
        Observable.combineLatest(
            emailTextField.rx.text,
            passwordTextField.rx.text,
            resultSelector: { [weak self] userEmail, userPassword in
                if let email = userEmail, let password = userPassword {
                    if email.count > 0 && password.count > 0 {
                        self?.viewModel?.userEmail = email
                        self?.viewModel?.userPassword = password
                        
                        self?.loginButton.isUserInteractionEnabled = true
                        self?.loginButton.alpha = 1.0
                    } else {
                        self?.loginButton.isUserInteractionEnabled = false
                        self?.loginButton.alpha = 0.6
                    }
                }
        }).subscribe().disposed(by: bag)
    }
    
    @IBAction func didClickOnLoginButton(_ sender: Any) {
        SVProgressHUD.show()
        viewModel?.loginUser()
    }
    
    @IBAction func didClickOnSignupButton(_ sender: Any) {
     //   viewModel?.showUserSignupView()
        viewModel?.showUserSignupView()
       
        
        
    }
    
   
    
}

extension UserLoginVC: UserLoginViewModelViewDelegate {
    func didCompleteUserLogin() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Login", message: "Your login is successful!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { [weak self] action in
            self?.emailTextField.text = ""
            self?.passwordTextField.text = "" 
            alert.dismiss(animated: true, completion: nil)
          //  self?.viewModel?.showUserListView()
        })
        present(alert, animated: true)
    }
    
    func didUserLoginFail() {
        SVProgressHUD.dismiss()
        
        let alert = UIAlertController(title: "User Login", message: "Your login failed, please try again!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        })
        present(alert, animated: true)
    }
}

extension UserLoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


                
                
         
            
            
        
        
        

    
    
    

