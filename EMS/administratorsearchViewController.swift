//
//  administratorsearchViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 4/23/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase

class administratorsearchViewController: UIViewController ,UITextFieldDelegate{
    let db = Firestore.firestore()
    var ref: DocumentReference?
    
    @IBOutlet var emailaddress: UITextField!
   

    @IBAction func searchbutton(_ sender: Any) {
        
        let docRef = db.collection("Employees").document(emailaddress.text!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let storyBoard  = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "popup") as! popupViewController
                self.addChildViewController(storyBoard)
                storyBoard.view.frame = self.view.frame
                self.view.addSubview(storyBoard.view)
                storyBoard.didMove(toParentViewController: self)
                storyBoard.searchemail = self.emailaddress.text!
                self.navigationController?.pushViewController(storyBoard, animated: true)
                
            }else{
                self.alert(title: "Alert!", messege: " Email Address isn't correct")
            }
            
        }


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailaddress.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

}
