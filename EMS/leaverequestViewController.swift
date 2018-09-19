//
//  leaverequestViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/11/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
class leaverequestViewController: UIViewController {
    let db = Firestore.firestore()
    var ref: DocumentReference?
    @IBOutlet var emailtext: UITextField!
  
    @IBOutlet var titletext: UITextField!
    @IBOutlet var sendertext: UITextField!
   
    @IBOutlet var msgtext: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        msgtext = UITextView()
        //msgtext.sizeThatFits(CGSize(width: msgtext.frame.size.width, height: msgtext.frame.size.height))
    }


    @IBAction func sendbutton(_ sender: Any) {

       let values : [String :String] = ["From":self.sendertext.text!,"Title":self.titletext.text!,"Message": self.msgtext.text!]
        let docRef = db.collection("Employees").document(self.emailtext.text!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
            let docRef = self.db.collection("Employees").document(self.emailtext.text!).collection("Messages").document()
        docRef.setData(values, completion: { (err) in
            if let err = err {
                print("Error adding document: \(err)")
                self.alert(title: "Alert!", messege: " Error  sending! please check again! ")
           

            } else {

                self.alert(title: "Alert!", messege: " Successful Operation!\n message is sent to : \(self.emailtext.text!)")
            }
        })
        
    }else{
                print("failed sending");
         self.alert(title: "Alert!", messege: "Sorry! Email Address isn't found")
            }

    }
        }

    
}


