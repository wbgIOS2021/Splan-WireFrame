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
    @IBOutlet weak var invitedUsersTableViewHeight: NSLayoutConstraint!

    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var editPlan: UIBarButtonItem!
    var bolValue:[Bool] = []
    var isComeFromPastPlan = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
      
        
        chatBtn.roundShadow()
        for _ in 0..<6{
            self.bolValue.append(false)
        }
        if isComeFromPastPlan == true{
            chatBtn.isHidden = true
            self.navigationItem.rightBarButtonItem = nil
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
        //Adding Observer
        self.eventDetailsTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.invitedUsersTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Removing Observer
        self.eventDetailsTableView.removeObserver(self, forKeyPath: "contentSize")
        self.invitedUsersTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    //Calling Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if let obj = object as? UIScrollView {
            if obj == self.eventDetailsTableView && keyPath == "contentSize" {
                if let newvalue = change?[.newKey]{
                    let newsize  = newvalue as! CGSize
                    self.eventDetailsTableViewHeight.constant = newsize.height
                }
            }else if obj == self.invitedUsersTableView && keyPath == "contentSize" {
                if let newvalue = change?[.newKey]{
                    let newsize  = newvalue as! CGSize
                    self.invitedUsersTableViewHeight.constant = newsize.height
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditDetailsViewController") as! EditDetailsViewController
        navigationController?.pushViewController(vc, animated: true)
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
            //cell.btn_1.isHidden = true
            cell.btn_3.isHidden = true
            if isComeFromPastPlan == true{
                cell.btn_1.isHidden = true
                cell.btn_2.setImage(UIImage(named: "restaurant_menu_icon"), for: UIControl.State.normal)

            }
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
            cell.inviteUserView.dropShadowLight()
        }else{
            cell.inviteUserView.layer.backgroundColor = white_color.cgColor
            cell.userName.textColor = dark_black_color
            cell.userMobile.textColor = dark_black_color
            cell.status.textColor = dark_black_color
            cell.mobileIcon.image = UIImage(named:"phone_icon_2")
            cell.inviteUserView.dropShadow()

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
