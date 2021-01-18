

import Foundation

class ApplicationModel: NSObject {
    
  //  static var sharedInstance = ApplicationModel()
    static var sharedInstanse = ApplicationModel()
    
    override private init() {
        print("ApplicationModel initialized!")
    }
    
    func isUserLoggedIn() -> Bool {
      //  let isLoggedIn = UserDefaults.standard.bool(forKey: UserDefaultKeys.isUserLoggedIn)
     //   return isLoggedIn
        
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: UserDefaultKeys.isUserLoggedIn)
        return isLoggedIn
    }
}
