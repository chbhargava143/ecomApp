//
//  ViewController.swift
//  ecomApp
//
//  Created by bhargava on 02/02/21.
//  Copyright © 2021 bhargava. All rights reserved.
//

import UIKit
import GoogleSignIn
class ViewController: UIViewController, GIDSignInDelegate {
    var window:UIWindow?
    var defaults = UserDefaults.standard
    @IBOutlet weak var didTapSIgin:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVc") as! HomeVc
            self.navigationController?.pushViewController(homeVc, animated: false)
            
        }
        GIDSignIn.sharedInstance().delegate = self
         // Automatically sign in the user.
        didTapSIgin.layer.cornerRadius = 7.5
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapsignInAction(_ sender:UIButton){
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
                 withError error: Error!) {
         if let error = error {
           if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
           return
         }
           
         // Perform any operations on signed in user here.
         let userId = user.userID                  // For client-side use only!
         let idToken = user.authentication.idToken // Safe to send to the server
         let fullName = user.profile.name
         let givenName = user.profile.givenName
         let familyName = user.profile.familyName
         let email = user.profile.email
        
         // ...
        print(userId ?? "")
        print(idToken ?? "")
        print(fullName ?? "")
        print(givenName ?? "")
        print(familyName ?? "")
        print(email ?? "")
        defaults.setUserDefaults(value: userId ?? "", key: "UserID")
        defaults.setUserDefaults(value: fullName ?? "", key: "FullName")
        defaults.setUserDefaults(value: email ?? "", key: "Email")
        UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
        UserDefaults.standard.synchronize()
      //performSegue(withIdentifier: "HomeVc", sender: self)
        
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVc") as! HomeVc
            self.navigationController?.pushViewController(homeVc, animated: true)
      
       func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
                 withError error: Error!) {
         // Perform any operations when the user disconnects from app here.
         // ...
       }
    func logIn(){
    if UserDefaults.standard.bool(forKey: "login") {
           //YES Already Login
            performSegue(withIdentifier: "HomeVc", sender: self)
//                       let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//                       let viewController = storyboard.instantiateViewController(withIdentifier: "HomeVc") as! HomeVc
//                       let navigationController = UINavigationController.init(rootViewController: viewController)
//                       self.window?.rootViewController = navigationController
//                       self.window?.makeKeyAndVisible()
       } else {
           //NOT Login
        UserDefaults.standard.removeObject(forKey: "googleEmail")
              let homeViewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
              view.window?.rootViewController = homeViewController
              view.window?.makeKeyAndVisible()
//           self.window = UIWindow(frame:UIScreen.main.bounds)
//                       let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//                       let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//                       let navigationController = UINavigationController.init(rootViewController: viewController)
//                       self.window?.rootViewController = navigationController
//                       self.window?.makeKeyAndVisible()
        }
        
    }
}

}
