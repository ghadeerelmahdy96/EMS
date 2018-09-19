//
//  showrequestsViewController.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/11/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
import Firebase
class showrequestsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var searchemail = String()
    var db = Firestore.firestore()
    var ref: DocumentReference?
    @IBOutlet var datatableview: UITableView!
    let upperpurple: UIColor = UIColor(displayP3Red:227/255, green: 185/255, blue: 219/255, alpha: 1)
    let middlepurple = UIColor(displayP3Red: 177/255, green: 104/255, blue: 177/255, alpha: 1)
    let lowerpurple = UIColor(displayP3Red: 152/255, green: 57/255, blue: 153/255, alpha: 1)
    
    var objects : [String] = [""]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : subtitlecell = datatableview.dequeueReusableCell(withIdentifier: "prototype", for: indexPath) as! subtitlecell
        cell.textLabel!.text = objects[indexPath.row]
        datatableview.backgroundColor = lowerpurple
        return cell
    }
    // selected cell setting
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedcell:UITableViewCell! = datatableview.cellForRow(at: indexPath)
        selectedcell.detailTextLabel!.text = " seen "
        selectedcell.detailTextLabel!.backgroundColor = UIColor.white
        selectedcell.tintColor = UIColor.black
        selectedcell.textLabel!.textColor = UIColor.black
        selectedcell.textLabel!.font = UIFont.boldSystemFont(ofSize: 35)
        selectedcell.accessoryType = UITableViewCellAccessoryType.checkmark
        
    }
    
    //text field delegate
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        //objects.append()

        self.datatableview.reloadData()
        //thingtodo.resignFirstResponder()
        return true
    }


}

