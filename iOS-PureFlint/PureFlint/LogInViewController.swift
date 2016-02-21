//
//  LogInViewController.swift
//  PureFlint
//
//  Created by Rohan Mishra on 2/20/16.
//  Copyright © 2016 haithammaaieh. All rights reserved.
//

import UIKit
import TextFieldEffects
import IBAnimatable
import Dodo

class LogInViewController: UIViewController {

    @IBOutlet weak var viewControllerTitle: UILabel!
    @IBOutlet weak var emailTextFieldLabel: UILabel!
    @IBOutlet weak var passwordTextFieldLabel: UILabel!
    
    @IBOutlet weak var emailTextField: YokoTextField!
    @IBOutlet weak var passwordTextField: YokoTextField!
    
    var email: String? = ""
    var password: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        email = emailTextField.text
        password = passwordTextField.text
        
        // Setting up error
        view.dodo.topLayoutGuide = topLayoutGuide
        view.dodo.bottomLayoutGuide = bottomLayoutGuide
        view.dodo.style.bar.hideAfterDelaySeconds = 2
        view.dodo.style.bar.animationShow = DodoAnimations.SlideVertically.show
        view.dodo.style.bar.animationHide = DodoAnimations.SlideVertically.hide
        
        // Guestures
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButton(sender: AnyObject) {
        if emailTextField.text == "" {
            displayError("You cannot leave the email field blank.")
            return
        } else if passwordTextField.text == "" {
            displayError("You cannot leave the password field blank.")
            return
        } else if emailTextField.text == "" && passwordTextField.text == "" {
            displayError("Please enter your name and email")
        }
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            API.logInUser(email!, password: password!, completion: { (success, data) -> Void in
                if success == true {
                    self.performSegueWithIdentifier("toPassword", sender: self)
                } else {
                    self.displayError("Email or password not working.")
                    print(data)
                }
            })
        }
    }
    
    func displayError(errorMessage: String) {
        view.dodo.error("\(errorMessage)")
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
