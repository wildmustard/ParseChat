
//
//  ChatViewController.swift
//  ParseChat
//
//  Created by John Henning on 2/4/16.
//  Copyright © 2016 John Henning. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Top
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        var message = PFObject(className: "message")
        message["text"] = textField.text
        message["user"] = PFUser.currentUser()
        
        message.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("Saved")
//                self.queryMessages()
            } else {
                print(error?.description)
            }
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
