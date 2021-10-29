//
//  InvitedUsersTableViewCell.swift
//  Splan
//
//  Created by Adarsh Raj on 28/10/21.
//

import UIKit

class InvitedUsersTableViewCell: UITableViewCell {

    @IBOutlet weak var ringImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var inviteUserView: UIView!
    @IBOutlet weak var userMobile: UILabel!
    @IBOutlet weak var mobileIcon: UIImageView!
    @IBOutlet weak var status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        inviteUserView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
