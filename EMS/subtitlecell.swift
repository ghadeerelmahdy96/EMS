//
//  Tableview.swift
//  EMS
//
//  Created by Ghadeer Elmahdy on 5/12/18.
//  Copyright © 2018 Ghadeer Elmahdy. All rights reserved.
//

import UIKit

class subtitlecell: UITableViewCell {
    let middlepurple = UIColor(displayP3Red: 177/255, green: 104/255, blue: 177/255, alpha: 1)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier )
        self.textLabel!.textColor = UIColor.white
        self.backgroundColor = middlepurple
        self.selectionStyle = UITableViewCellSelectionStyle.default
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

