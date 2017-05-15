//
//  NewSnapViewController.swift
//  MySnap
//
//  Created by Preeti Patel on 15/05/17.
//  Copyright © 2017 Vandan Patel. All rights reserved.
//

import UIKit

class NewSnapViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
        
        descriptionTextField.delegate = self
        
    }
    
    func keyboardWillShow(notification: Notification) {
        self.bottomConstraint.constant = 270.0
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
        print("Keyboard Showed Up")
    }
    
    func keyboardWillHide(notification: Notification) {
        print("Keyboard hidden")
        self.bottomConstraint.constant = 240.0
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
