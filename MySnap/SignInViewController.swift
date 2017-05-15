//
//  SignInViewController.swift
//  MySnap
//
//  Created by Preeti Patel on 13/05/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func turnUpPressed(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print("Hey, We have an error : \(String(describing: error?.localizedDescription))")
                FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil {
                        print("Hey, We have an error : \(String(describing: error?.localizedDescription))")
                    } else {
                        print("Created User Successfully")
                        self.performSegue(withIdentifier: "SignInSegue", sender: nil)
                    }
                })
            } else {
                print("Signed-In Successfully")
                self.performSegue(withIdentifier: "SignInSegue", sender: nil)
            }
        })
    }
}

