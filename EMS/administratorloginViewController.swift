//
//  administratorloginViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 4/10/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class administratorloginViewController: UIViewController ,UITextFieldDelegate{

    var ref: DatabaseReference!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
      ref = Database.database().reference(fromURL: "https://testfordatabase-4b2e5.firebaseio.com/")
      
    }

    @IBAction func loginbutton(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                print(error!)
                 self.alert(title: "Alert!", messege: " Email Address/password isn't correct")
                return
            }
            print("you signed in successfully")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "all")
            self.navigationController?.pushViewController(nextViewController, animated: true)

        }

           }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
   
}
