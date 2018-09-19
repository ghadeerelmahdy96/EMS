//
//  testjsonphpmyadminlogin.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 4/21/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import Foundation
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
}
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0
    {
        return data.count
        
    }else{
        let selectedtopic = pickerView.selectedRow(inComponent: 0)
        return  data[selectedtopic].choices.count
    }
}
func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0
    {
        return data[row].topic
    }else{
        let selectedtopic = pickerView.selectedRow(inComponent: 0)
        return  data[selectedtopic].choices[row]
    }
    
}
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerView.reloadComponent(1)
    // pickerView.reloadComponent(2)
    //pickerView.reloadComponent(3)
}
