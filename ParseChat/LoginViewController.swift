//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Alex Clark on 2/4/16.
//  Copyright © 2016 John Henning. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        
        var user = PFUser()

        user.email = emailText.text
        user.password = passwordText.text
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print(errorString)
            } else {
                self.performSegueWithIdentifier("", sender: self)
            }
        }
    }
    
    
    @IBAction func onLogin(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(emailText.text!, password: passwordText.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("", sender: self)
            }
            else {
                    let errorString = error!.userInfo["error"] as? NSString
                    print(errorString)
            }
        }
    
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
