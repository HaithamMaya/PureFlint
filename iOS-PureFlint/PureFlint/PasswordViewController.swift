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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
