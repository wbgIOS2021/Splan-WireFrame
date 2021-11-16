//
//  ContactListTableViewCell.swift
//  Splan
//
//  Created by Adarsh Raj on 09/11/21.
//

import UIKit

class ContactListTableViewCell: UITableViewCell {

    @IBOutlet weak var contact_view: UIView!
    @IBOutlet weak var contact_image: UIImageView!
    @IBOutlet weak var contact_name: UILabel!
    @IBOutlet weak var contact_check_btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contact_view.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}



