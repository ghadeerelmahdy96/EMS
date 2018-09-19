//
//  employeepanelViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/11/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit

class employeepanelViewController: UIViewController {
var email = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func requestsbutton(_ sender: Any) {
        let storyBoard  = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "showrequests") as! employeeshowdataViewController
        self.addChildViewController(storyBoard)
        storyBoard.view.frame = self.view.frame
        self.view.addSubview(storyBoard.view)
        storyBoard.didMove(toParentViewController: self)
        storyBoard.searchemail = email
        self.navigationController?.pushViewController(storyBoard, animated: true)

    }

    
    @IBAction func viewaccountbutton(_ sender: Any) {
        let storyBoard  = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "showpopup2") as! employeeshowdataViewController
        self.addChildViewController(storyBoard)
        storyBoard.view.frame = self.view.frame
        self.view.addSubview(storyBoard.view)
        storyBoard.didMove(toParentViewController: self)
        storyBoard.searchemail = email
         self.navigationController?.pushViewController(storyBoard, animated: true)
           }
   
    }



