//
//  File.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 3/30/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit
extension administratoraddViewController{
func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
    let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
    present(alert, animated: true, completion: nil)
}
}
extension administratorsearchViewController{
    func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}
    extension popupViewController{
        func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
            let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
            present(alert, animated: true, completion: nil)
        }
    }

extension administratoreditViewController{
    func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}
extension administratorloginViewController{
    func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}
extension employeeloginViewController{
    func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}
extension leaverequestViewController{
    func alert (title :String, messege: String, action: String = "ok", handler : ((UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action, style: .default, handler: handler))
        present(alert, animated: true, completion: nil)
    }
}

