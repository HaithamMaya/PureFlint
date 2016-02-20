//
//  CreateAccountViewController.swift
//  PureFlint
//
//  Created by Rohan Mishra on 2/20/16.
//  Copyright © 2016 haithammaaieh. All rights reserved.
//

import UIKit
import TextFieldEffects
import IBAnimatable
import Dodo

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var fullNameField: YokoTextField!
    @IBOutlet weak var emailField: YokoTextField!
    
    @IBOutlet weak var viewTitleLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var nextButton: AnimatableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kerning
        viewTitleLabel.kern(1)
        fullNameLabel.kern(1)
        emailLabel.kern(1)
        nextButton.kern(1)
        
        // Guestures
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Setting up error
        view.dodo.topLayoutGuide = topLayoutGuide
        view.dodo.bottomLayoutGuide = bottomLayoutGuide
        view.dodo.style.bar.hideAfterDelaySeconds = 3
        view.dodo.style.bar.animationShow = DodoAnimations.SlideVertically.show
        view.dodo.style.bar.animationHide = DodoAnimations.SlideVertically.hide
        
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestinationController: PasswordViewController = segue.destinationViewController as! PasswordViewController
        
        DestinationController.name = fullNameField.text
        DestinationController.email = emailField.text
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
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        if fullNameField.text == "" {
            displayError("You cannot leave the name field blank")
        } else if emailField.text == "" {
            displayError("You cannot leave the email field blank.")
        } else {
            API.checkEmail(emailField.text!) { (success, data) -> Void in
                if success == true {
                    self.performSegueWithIdentifier("toPassword", sender: self)
                } else {
                    self.displayError("Your email doesn't appear to be working. Please check your email and try again.")
                    print(data)
                }
            }
        }
    }
}
