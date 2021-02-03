//
//  HomeVc.swift
//  ecomApp
//
//  Created by bhargava on 02/02/21.
//  Copyright © 2021 bhargava. All rights reserved.
//

import UIKit
import GoogleSignIn
class HomeVc: UIViewController {
   
    @IBOutlet weak var emailLbl:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLbl.text = UserDefaults.standard.string(forKey: "Email")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapSignOut(_ sender: AnyObject) {
        
        GIDSignIn.sharedInstance().signOut()
        UserDefaults.standard.set(false, forKey: "ISUSERLOGGEDIN")
//        let homeViewController = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
        self.navigationController?.popToRootViewController(animated: true)
//                let navController = UINavigationController(rootViewController: ViewController)
//                navController.navigationBar.barStyle = .default
//                self.present(navController, animated: true, completion: nil)
       
    }

}
