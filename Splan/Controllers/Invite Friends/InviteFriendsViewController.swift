//
//  InviteFriendsViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 09/11/21.
//

import UIKit

class InviteFriendsViewController: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var invitationMessageTextBox: UITextView!
    @IBOutlet weak var upperView: RoundView!
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var upperViewHeight: NSLayoutConstraint!
    @IBOutlet weak var usersTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var inviteFriendBtn: UIButton!
    @IBOutlet weak var submitPlanBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        invitationMessageTextBox.delegate = self
        invitationMessageTextBox.layer.cornerRadius = 10
        invitationMessageTextBox.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        invitationMessageTextBox.text = "Enter Invitation Message"
        invitationMessageTextBox.textColor = UIColor.darkGray
        invitationMessageTextBox.dropShadow()
        inviteFriendBtn.dropShadow()
        submitPlanBtn.dropShadow()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        
        //Adding Observer
        self.usersTableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Removing Observer
        self.usersTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    //Calling Observer
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if let obj = object as? UIScrollView {
            if obj == self.usersTableView && keyPath == "contentSize" {
                if let newvalue = change?[.newKey]{
                    let newsize  = newvalue as! CGSize
                    self.usersTableViewHeight.constant = newsize.height
                    self.upperViewHeight.constant = newsize.height + 100
                }
            }
        }
    }

    func cellRegister()
    {
        usersTableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
        
    }
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func inviteFriendsActionBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectContactViewController") as! SelectContactViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func submitPlanActionBtn(_ sender: Any) {
    }
    

}

extension InviteFriendsViewController: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if invitationMessageTextBox.textColor == UIColor.darkGray {
        invitationMessageTextBox.text = ""
        invitationMessageTextBox.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if invitationMessageTextBox.text == "" {
        invitationMessageTextBox.text = "Enter Invitation Message"
        invitationMessageTextBox.textColor = UIColor.darkGray
        }
    }
}


extension InviteFriendsViewController: UITableViewDataSource
{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = usersTableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
    return cell
}


}

