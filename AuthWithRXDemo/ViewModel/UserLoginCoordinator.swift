
//

import UIKit

class UserLoginCoordinator: Coordinator {
    
    let window: UIWindow!
    weak var delegate: UserLoginCoordinatorDelegate?
    
    init(withWindow: UIWindow) {
        self.window = withWindow
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let loginVC = storyboard.instantiateViewController(withIdentifier: "UserLoginVC") as! UserLoginVC
        let loginViewModel = UserLoginViewModel()
        loginViewModel.coordinatorDelegate = self
        loginViewModel.model = UserModel.sharedInstance
        loginVC.viewModel = loginViewModel
        
        self.window.rootViewController = loginVC
    }
}

extension UserLoginCoordinator: UserLoginViewModelCoordinatorDelegate {
    func didCompleteUserLogin() {
        delegate?.didCompleteUserLogin()
    }
    
    func showUserSignupView() {
        delegate?.showUserSignupView()
    }
}
