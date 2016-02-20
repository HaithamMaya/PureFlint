//
//  ViewController.swift
//  PureFlint
//
//  Created by Haitham Maaieh on 2/20/16.
//  Copyright © 2016 haithammaaieh. All rights reserved.
//

import UIKit
import IBAnimatable

class MainViewController: UIViewController {

    @IBOutlet weak var viewTitle: AnimatableLabel!
    @IBOutlet weak var signUpButton: AnimatableButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewTitle.kern(1)
        signUpButton.kern(1)
        logInButton.kern(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

