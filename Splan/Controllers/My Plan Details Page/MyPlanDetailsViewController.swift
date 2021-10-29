//
//  MyPlanDetailsViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 28/10/21.
//

import UIKit

class MyPlanDetailsViewController: UIViewController {

    @IBOutlet weak var eventDetailsTableView: UITableView!
    @IBOutlet weak var eventDetailsTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var invitedUsersTableView: UITableView!
    @IBOutlet weak var chatBtn: UIButton!
    
    var bolValue:[Bool] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        chatBtn.roundShadow()
        for _ in 0..<6{
            self.bolValue.append(false)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
        //Adding Observer
        self.eventDetailsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Removing Observer
        self.eventDetailsTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    //Calling Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if let obj = object as? UIScrollView {
            if obj == self.eventDetailsTableView && keyPath == "contentSize" {
                if let newvalue = change?[.newKey]{
                    let newsize  = newvalue as! CGSize
                    self.eventDetailsTableViewHeight.constant = newsize.height
                }
            }
        }
    }
    
    
    func cellRegister()
    {
        eventDetailsTableView.register(UINib(nibName: "EventPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "EventPlaceTableViewCell")
        invitedUsersTableView.register(UINib(nibName: "InvitedUsersTableViewCell", bundle: nil), forCellReuseIdentifier: "InvitedUsersTableViewCell")
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
    }
    @IBAction func chatBtnAction(_ sender: Any) {
    }
    
}

extension MyPlanDetailsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == eventDetailsTableView{
            return 1
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == eventDetailsTableView{
            let cell = eventDetailsTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
            return cell
        }
        let cell = invitedUsersTableView.dequeueReusableCell(withIdentifier: "InvitedUsersTableViewCell", for: indexPath) as! InvitedUsersTableViewCell
        if bolValue[indexPath.row]
        {
            cell.inviteUserView.layer.backgroundColor = light_black_color.cgColor
            cell.userName.textColor = white_color
            cell.userMobile.textColor = white_color
            cell.status.textColor = white_color
            cell.mobileIcon.image = UIImage(named:"phone_icon_3")
            
        }else{
            cell.inviteUserView.layer.backgroundColor = white_color.cgColor
            cell.userName.textColor = dark_black_color
            cell.userMobile.textColor = dark_black_color
            cell.status.textColor = dark_black_color
            cell.mobileIcon.image = UIImage(named:"phone_icon_2")
            

        }
        return cell
    }
    
    
}
extension MyPlanDetailsViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == invitedUsersTableView{
            if bolValue[indexPath.row]{
                for x in 0..<bolValue.count{
                    if x == indexPath.row{
                        bolValue[x] = true
                    }
                }
            }else{
                for x in 0..<bolValue.count{
                    if x == indexPath.row{
                        bolValue[x] = true
                    }else{
                        bolValue[x] = false
                    }
                }
            }
            invitedUsersTableView.reloadData()
        }
    }
    
}
