//
//  userDefaults.swift
//  userDefaults
//
//  Created by bhargava on 03/02/21.
//

import Foundation
enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}
extension UserDefaults{
    func setUserDefaults(value:Any?,key:String?){
        UserDefaults.standard.setValue(value, forKey: key ?? "")
        UserDefaults.standard.synchronize()
        
    }
   
}
extension UserDefaults{

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        //synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    //MARK: Save User Data
    func setUserID(value: Int){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
        //synchronize()
    }

    //MARK: Retrieve User Data
    func getUserID() -> Int{
        return integer(forKey: UserDefaultsKeys.userID.rawValue)
    }
}
/*
 Retrieve data anywhere in app

print("ID : \(UserDefaults.standard.getUserID())")
UserDefaults.standard.getUserID()
Remove Values

UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userID)
 */

