//
//  popupViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 4/23/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
class popupViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet var nametext: UITextField!
    @IBOutlet var emailtext: UITextField!
    @IBOutlet var addresstext: UITextField!
    @IBOutlet var phonetext: UITextField!
    @IBOutlet var gendertext: UITextField!
    @IBOutlet var deptext: UITextField!
    @IBOutlet var birhtext: UITextField!
    @IBOutlet var salarytext: UITextField!
    @IBOutlet var exptext: UITextField!
    @IBOutlet var bonustext: UITextField!


    
      var searchemail = String()

    
    var db = Firestore.firestore()
    var ref: DocumentReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showAnimate()
        nametext.delegate = self
        emailtext.delegate = self
        addresstext.delegate = self
        phonetext.delegate = self
        salarytext.delegate = self
        gendertext.delegate = self
        deptext.delegate = self
        birhtext.delegate = self
        exptext.delegate = self
        bonustext.delegate = self
        

           }
    
    @IBAction func editdatabutton(_ sender: Any) {
        let docRef = db.collection("Employees").document(searchemail)
        
        docRef.updateData(
            [
                "Name":nametext.text!,
                "EmailAddress":emailtext.text!,
                "Address":addresstext.text!,
                "phoneNumber":phonetext.text!,
                "salary":salarytext.text!,
                "Gender":gendertext.text!,
                "Department":deptext.text!,
                "Birthday":birhtext.text!,
                "Experience":exptext.text!,
                "Bonus":bonustext.text!
            ]
            
        ) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                
                self.alert(title: "Alert!", messege: " Document successfully updated")
            }
        }

    }

    
    @IBAction func Showdatabutton(_ sender: Any) {
        let docRef = db.collection("Employees").document(searchemail)
        docRef.getDocument { (document, error) in
            guard let document = document, document.exists else {  return  }
            let data = document.data()
            let name = data?["Name"] as? String ?? ""
            let email = data?["EmailAddress"] as? String ?? ""
            let address = data?["Address"] as? String ?? ""
            let phoneNumber = data?["phoneNumber"] as? String ?? ""
            let salary = data?["salary"] as? String ?? ""
            let Gender = data?["Gender"] as? String ?? ""
            let department = data?["Department"] as? String ?? ""
            let birthday = data?["Birthday"] as? String ?? ""
            let experience = data?["Experience"] as? String ?? ""
            let bonus = data?["Bonus"] as? String ?? ""

            self.nametext.text = name
             self.emailtext.text = email
             self.addresstext.text = address
             self.phonetext.text = phoneNumber
             self.salarytext.text = salary
             self.gendertext.text = Gender
             self.deptext.text = department
             self.birhtext.text = birthday
             self.exptext.text = experience
             self.bonustext.text = bonus
            
            
   var fixedWidth = self.nametext.frame.size.width
   var newSize = self.nametext.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.nametext.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.emailtext.frame.size.width
             newSize = self.emailtext.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.emailtext.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.exptext.frame.size.width
            newSize = self.exptext.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.exptext.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.addresstext.frame.size.width
            newSize = self.addresstext.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.addresstext.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.phonetext.frame.size.width
            newSize = self.phonetext.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.phonetext.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            

            }


           }


 func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
