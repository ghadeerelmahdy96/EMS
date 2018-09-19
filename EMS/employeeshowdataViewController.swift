//
//  employeeshowdataViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/11/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
class employeeshowdataViewController: UIViewController {
    var db = Firestore.firestore()
    var ref: DocumentReference?
    var searchemail = String()
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var birth: UITextField!
    @IBOutlet var exp: UITextField!
    @IBOutlet var bonus: UITextField!
    @IBOutlet var salary: UITextField!
    @IBOutlet var dep: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showbutton(_ sender: Any) {
        let docRef = db.collection("Employees").document(searchemail)
        docRef.getDocument { (document, error) in
            let data = document?.data()
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
            
            self.name.text = name
            self.email.text = email
            self.address.text = address
            self.phone.text = phoneNumber
            self.salary.text = salary
            self.gender.text = Gender
            self.dep.text = department
            self.birth.text = birthday
            self.exp.text = experience
            self.bonus.text = bonus
            
            
            var fixedWidth = self.name.frame.size.width
            var newSize = self.name.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.name.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.email.frame.size.width
            newSize = self.email.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.email.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.exp.frame.size.width
            newSize = self.exp.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.exp.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.address.frame.size.width
            newSize = self.address.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.address.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            fixedWidth = self.phone.frame.size.width
            newSize = self.phone.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            self.phone.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
            
            
        }
        

            
    }


}
