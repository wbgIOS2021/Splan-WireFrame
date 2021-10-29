//
//  EventPlaceTableViewCell.swift
//  Splan
//
//  Created by Adarsh Raj on 27/10/21.
//

import UIKit

class EventPlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var event_image: UIImageView!
    @IBOutlet weak var eventView: RoundView!
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_meet_time: UILabel!
    @IBOutlet weak var no_of_invite: UILabel!
    @IBOutlet weak var event_place: UILabel!
    @IBOutlet weak var event_status: UILabel!
    @IBOutlet weak var call_btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        eventView.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
