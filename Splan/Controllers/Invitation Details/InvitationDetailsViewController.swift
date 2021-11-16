//
//  InvitationDetailsViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 06/11/21.
//

import UIKit

class InvitationDetailsViewController: UIViewController {
    @IBOutlet weak var event_image: RoundImage!
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_place: UILabel!
    @IBOutlet weak var event_meet_time: UILabel!
    @IBOutlet weak var total_accepted: UILabel!
    @IBOutlet weak var total_invited: UILabel!
    @IBOutlet weak var restaurant_special: UILabel!
    @IBOutlet weak var event_status: UILabel!
    @IBOutlet weak var price_for_one: UILabel!
    
    @IBOutlet weak var AcceptBtn: RoundButton!
    @IBOutlet weak var DenyBtn: RoundButton!
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var userListTableViewHeight: NSLayoutConstraint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
        //Adding Observer
        self.userListTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Removing Observer
        self.userListTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    //Calling Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if let obj = object as? UIScrollView {
            if obj == self.userListTableView && keyPath == "contentSize" {
                if let newvalue = change?[.newKey]{
                    let newsize  = newvalue as! CGSize
                    self.userListTableViewHeight.constant = newsize.height
                }
            }
        }
    }
    
    func cellRegister()
    {
        userListTableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
        
    }
    

}


//MARK:- Action Button
extension InvitationDetailsViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func restaurantMenuActionBtn(_ sender: Any) {
    }

    @IBAction func acceptActionBtn(_ sender: Any) {
    }
    @IBAction func denyActionBtn(_ sender: Any) {
    }
    @IBAction func bookCabActionBtn(_ sender: Any) {
    }
    @IBAction func chatActionBtn(_ sender: Any) {
    }
}

extension InvitationDetailsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        cell.cancelBtn.isHidden = true
        return cell
    }
    
    
}

