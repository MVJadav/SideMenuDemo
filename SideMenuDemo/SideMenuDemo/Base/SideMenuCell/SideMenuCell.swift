//
//  SideMenuCell.swift
//  boundlesscaregivers
//
//  Created by mac on 30/07/18.
//  Copyright © 2018 mac.com. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet var lblTitle                  : UILabel!
    @IBOutlet weak var imgSideMenu          : UIImageView!
    @IBOutlet weak var notiCountView        : UIView!
    @IBOutlet weak var lblNotiCount         : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.updateNotifictionCount()
        self.lblTitle.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateNotifictionCount() {
        notiCountView.layer.cornerRadius = notiCountView.frame.size.width/2
        notiCountView.clipsToBounds = true
    }
}
