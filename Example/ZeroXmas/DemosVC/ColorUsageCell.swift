//
//  ColorUsageCell.swift
//  ZeroXmas_Example
//
//  Created by screson on 2019/1/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ColorUsageCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCode: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lbTitle.font = UIFont.zx.titleFont()
        self.lbTitle.textColor = UIColor.zx.body
        
        self.lbCode.font = UIFont.zx.bodyFont()
        self.lbCode.textColor = UIColor.zx.tint
        
        colorView.layer.borderWidth = 1.0
        colorView.layer.borderColor = UIColor.zx.border.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
