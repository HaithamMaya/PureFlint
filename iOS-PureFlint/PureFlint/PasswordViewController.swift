//
//  PasswordViewController.swift
//  PureFlint
//
//  Created by Rohan Mishra on 2/20/16.
//  Copyright © 2016 haithammaaieh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import TextFieldEffects
import IBAnimatable
import Dodo

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var passwordFieldLabel: UILabel!
    @IBOutlet weak var confirmPasswordFieldLabel: UILabel!
    
    
    @IBOutlet weak var passwordTextField: YokoTextField!
    @IBOutlet weak var confirmPasswordTextField: YokoTextField!
    
    @IBOutlet weak var getStartedButton: AnimatableButton!
    
    var name: String?
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTitle.kern(1)
        passwordFieldLabel.kern(1)
        confirmPasswordFieldLabel.kern(1)
        getStartedButton.kern(1)
        
        // Guestures
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Setting up error
        view.dodo.topLayoutGuide = topLayoutGuide
        view.dodo.bottomLayoutGuide = bottomLayoutGuide
        view.dodo.style.bar.hideAfterDelaySeconds = 3
        view.dodo.style.bar.animationShow = DodoAnimations.SlideVertically.show
        view.dodo.style.bar.animationHide = DodoAnimations.SlideVertically.hide
        
        password = confirmPasswordTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func displayError(errorMessage: String) {
        view.dodo.error("\(errorMessage)")
    }
    
    @IBAction func getStarted(sender: AnyObject) {
        if passwordTextField.text == "" {
            displayError("Enter your password!")
        } else if confirmPasswordTextField.text == "" {
            displayError("Re-enter your password!")
        } else if passwordTextField.text?.characters.count < 8 {
            displayError("Your password must be greater than eight characters!")
        } else if passwordTextField.text?.characters.count > 16 {
            displayError("Your password must be less than sixteen characters!")
        } else if passwordTextField.text != confirmPasswordTextField.text {
            displayError("Passwords must match")
        } else {
            API.registerUser(name!, email: email!, password: password!, role: 3, completion: { (success, data) -> Void in
                if success == true {
                    print(data)
                } else {
                    self.displayError("Something went wrong, please try again later.")
                    print(data)
                }
            })
        }
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
