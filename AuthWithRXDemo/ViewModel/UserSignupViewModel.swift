
import Foundation
class UserSignupViewModel: NSObject {
    
    weak var viewDelegate: UserSignupViewModelViewDelegate?
    weak var coordinatorDelegate: UserSignupViewModelCoordinatorDelegate?
    
    var model: UserModel?
    var userName: String?
    var userEmail: String?
    var password: String?
    
    func showUserLoginView() {
        coordinatorDelegate?.showUserLoginView()
    }
    
    func signupUser() {
        model?.signupUserWith(name: userName!, email: userEmail!, password: password!) { [weak self] didSignup in
            if didSignup == true {
                self?.viewDelegate?.didCompleteUserSignup()
            } else {
                self?.viewDelegate?.didUserSignupFail()
            }
        }
    }
}
    
    


