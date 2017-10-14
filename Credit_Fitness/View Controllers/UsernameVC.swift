//
//  UsernameVC.swift
//  Credit_Fitness
//
//  Created by Anshula Singh on 10/14/17.
//  Copyright © 2017 Anshula Singh. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class UsernameVC: UIViewController {
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        // 1
        guard let firUser = Auth.auth().currentUser,
            let username = username.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                return
                
            }
            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }//print("Created new user: \(user.username)")
        }
    }
//        guard let firUser = Auth.auth().currentUser,
//            let username = username.text,
//            !username.isEmpty else { return }
//
//        // 2
//        let userAttrs = ["username": username]
//
//        // 3
//        let ref = Database.database().reference().child("users").child(firUser.uid)
//
//        // 4
//        ref.setValue(userAttrs) { (error, ref) in
//            if let error = error {
//                assertionFailure(error.localizedDescription)
//                return
//            }
//
//            // 5
//            ref.observeSingleEvent(of: .value, with: { (snapshot) in
//                let user = User(snapshot: snapshot)
//
//                // handle newly created user here
//            })
//        }
}
    



