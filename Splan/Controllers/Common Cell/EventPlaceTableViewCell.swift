//
//  EventPlaceTableViewCell.swift
//  Splan
//
//  Created by Adarsh Raj on 27/10/21.
//

import UIKit

class EventPlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var event_image: UIImageView!
    
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_meet_time: UILabel!
    @IBOutlet weak var total_accepted: UILabel!
    @IBOutlet weak var total_invited: UILabel!
    @IBOutlet weak var event_place: UILabel!
    @IBOutlet weak var event_hosted_by: UILabel!
    @IBOutlet weak var event_status: UILabel!
    @IBOutlet weak var price_for_one: UILabel!
    @IBOutlet weak var restaurant_special: UILabel!
    
    @IBOutlet weak var host_stackview: UIStackView!
    
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    
    @IBOutlet weak var total_accepted_view: UIView!
    @IBOutlet weak var eventView: RoundView!
    @IBOutlet weak var by_venue_View: RoundView!
    @IBOutlet weak var price_for_one_View: RoundView!

    @IBOutlet weak var event_image_height: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        eventView.dropShadow()
        btn_3.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
