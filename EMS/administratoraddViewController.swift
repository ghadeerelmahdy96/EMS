//
//  administratoraddViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 3/27/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class administratoraddViewController: UIViewController,UITextFieldDelegate{
      let db = Firestore.firestore()
    var ref: DocumentReference?

    @IBOutlet var nametext: UITextField!
    @IBOutlet var emailtext: UITextField!
    @IBOutlet var addresstext: UITextField!
    @IBOutlet var phonenumtext: UITextField!
    @IBOutlet var salarytext: UITextField!
    @IBOutlet var gendertext: UITextField!
    @IBOutlet var departmenttext: UITextField!
    @IBOutlet var birthdaytext: UITextField!
    @IBOutlet var experiencetext: UITextField!
    @IBOutlet var bonustext: UITextField!


    
    override func viewDidLoad() {

               super.viewDidLoad()
        nametext.delegate = self
        emailtext.delegate = self
        addresstext.delegate = self
        phonenumtext.delegate = self
        salarytext.delegate = self
        gendertext.delegate = self
        departmenttext.delegate = self
        birthdaytext.delegate = self
        experiencetext.delegate = self
        bonustext.delegate = self
       
    }

    @IBAction func addemployeebutton(_ sender: Any) {
        let nt = nametext.text
        let et = emailtext.text
        let at = addresstext.text
        let pt = phonenumtext.text
        let st = salarytext.text
         let gt = gendertext.text
         let dt = departmenttext.text
         let bt = birthdaytext.text
         let ext = experiencetext.text
         let bot = bonustext.text
        if((nt?.isEmpty)! || (et?.isEmpty)! || (at?.isEmpty)! || (pt?.isEmpty)! || (st?.isEmpty)!){
            self.alert(title: "Alert!", messege: " All fields is required")
            
        }else{
            
            // let employeerefrence = ref.child("Employees").child("newadd")
            let values : [String :String] = ["Name":nt!,"EmailAddress": et!,"Address":at!,"phoneNumber":pt!,"salary":st!,"Gender":gt!,"Department":dt!,"Birthday":bt!,"Experience":ext!,"Bonus":bot!]
            let doc = emailtext.text!
            ref = db.collection("Employees").document(doc)
            
            
            // Add a new document with a generated ID
            ref?.setData(values, completion: { (err) in
                if let err = err {
                    print("Error adding document: \(err)")
                      self.alert(title: "Alert!", messege: " Error adding document! Maybe you have added the same \(self.ref!.documentID) before")
                } else {
                    print("Document added with ID: \(self.ref!.documentID)")
                    self.alert(title: "Alert!", messege: " Successful Operation!\n you added : \(self.ref!.documentID)")
                }
            })
            
        }

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
 

