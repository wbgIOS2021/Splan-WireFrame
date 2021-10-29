//
//  UserListTableViewCell.swift
//  Splan
//
//  Created by Adarsh Raj on 28/10/21.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var userlistView: RoundView!
    @IBOutlet weak var userImage: RoundImage!
    @IBOutlet weak var cancelBtn: RoundButton!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cancelBtn.roundShadow()
        userlistView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
