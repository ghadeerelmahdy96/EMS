//
//  employeeloginViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/11/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
class employeeloginViewController: UIViewController ,UITextFieldDelegate{
    let db = Firestore.firestore()
    var ref: DocumentReference?
    
    @IBOutlet var emailtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       emailtext.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func loginbutton(_ sender: Any) {
        let docRef = db.collection("Employees").document(emailtext.text!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                print("successfuly login")
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "employeepanel") as! employeepanelViewController
                nextViewController.email = self.emailtext.text!
                self.navigationController?.pushViewController(nextViewController, animated: true)

            } else{
              print("failed login");
             self.alert(title: "Alert!", messege: "Sorry! your Email Address isn't found")
            }

    }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
