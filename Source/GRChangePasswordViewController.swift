//
//  GRChangePasswordViewController.swift
//  Graffiti
//
//  Created by adeiji on 4/24/18.
//  Copyright © 2018 Dephyned. All rights reserved.
//

import UIKit
import FirebaseAuth

public class GRChangePasswordViewController: UIViewController {

    weak var changePasswordView:GRSimpleEntryView!
    weak var originalPasswordTextField:UITextField!
    weak var newPasswordTextField:UITextField!
    weak var newPasswordVerifyTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dispose of any resources that can be recreated.
        let changePasswordView = GRSimpleEntryView()
        changePasswordView.setup(superview: self.view, numberOfTextFields: 3, header: "CHANGE PASSWORD", labelsText: ["Current Password", "New Password", "Verify New Password"])
        self.originalPasswordTextField = changePasswordView.textFields[0]
        self.newPasswordTextField = changePasswordView.textFields[1]
        self.newPasswordVerifyTextField = changePasswordView.textFields[2]
        
        self.originalPasswordTextField.placeholder = "Enter Password"
        self.newPasswordTextField.placeholder = "Enter New Password"
        
        self.changePasswordView = changePasswordView
        self.changePasswordView.navBar.rightButton.addTargetClosure { (_) in
            if let user = Auth.auth().currentUser {
                self.changePassword(user: user)
            }
        }
        
        self.changePasswordView.navBar.leftButton.addTargetClosure { (_) in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func changePassword(user: User) {
        let message = self.validate()
        if message == nil {
            let credential:AuthCredential = EmailAuthProvider.credential(withEmail: user.email ?? "", password: self.originalPasswordTextField.text!)
            user.reauthenticate(with: credential, completion: { (error) in
                if let error = error {
                    print("GRChangePasswordViewController.viewDidLoad-leftButton.addTargetClosure  There was an issue re-authenticating the user, in this instance, probably the password was incorrect: \(error.localizedDescription)")
                } else {
                    user.updatePassword(to: self.newPasswordTextField.text!, completion: { (error) in
                        if let error = error {
                            print("GRChangePasswordViewController.viewDidLoad-leftButton.addTargetClosure Error updating the users password with error: \(error.localizedDescription)")
                        } else {
                            self.navigationController?.popViewController(animated: true)
                        }
                    })
                }
            })
        } else {
            let alertController = UIAlertController(title: "Password Issue", message:message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func validate () -> String! {
        
        if let originalPassword = self.originalPasswordTextField.text {
            if originalPassword.trimmingCharacters(in: .whitespaces) == "" {
                return "Please enter your current password"
            }
        } else {
            return "Please enter your current password"
        }
        if let newPassword = self.newPasswordTextField.text {
            if newPassword.trimmingCharacters(in: .whitespaces) == "" {
                return "Please enter your new password"
            } else if newPassword.count < 5 {
                return "Sorry, but your password must be at least 5 characters"
            }
            
            if let passwordVerify = self.newPasswordVerifyTextField.text {
                if passwordVerify != newPassword {
                    return "Please make sure that you enter the same password in the new password and verify password boxes"
                }
            } else {
                return "Please make sure that you enter the same password in the new password and verify password boxes"
            }
        }
        
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


