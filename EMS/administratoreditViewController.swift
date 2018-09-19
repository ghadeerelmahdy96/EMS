//
//  administratoreditViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 4/5/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
class administratoreditViewController: UIViewController,UITextFieldDelegate {
    let db = Firestore.firestore()
    var ref: DocumentReference?

    @IBOutlet var emailsearch: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailsearch.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func editbutton(_ sender: Any) {
        
            let docRef = db.collection("Employees").document(emailsearch.text!)
            docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let storyBoard  = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "popup") as! popupViewController
                self.addChildViewController(storyBoard)
                storyBoard.view.frame = self.view.frame
                self.view.addSubview(storyBoard.view)
                storyBoard.didMove(toParentViewController: self)
                storyBoard.searchemail = self.emailsearch.text!
                self.navigationController?.pushViewController(storyBoard, animated: true)
                }else{
                self.alert(title: "Alert!", messege: " Email Address isn't correct")
                }

    }
}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
