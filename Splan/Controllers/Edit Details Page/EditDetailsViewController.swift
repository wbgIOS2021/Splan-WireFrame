//
//  EditDetailsViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 28/10/21.
//

import UIKit

class EditDetailsViewController: UIViewController {

    
    
    @IBOutlet weak var restaurantImage: RoundImage!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantStatus: UILabel!
    @IBOutlet weak var selectDateBtn: RoundButton!
    @IBOutlet weak var inviteFriendBtn: RoundButton!
    @IBOutlet weak var selectTimeBtn: RoundButton!
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var userListTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var submitPlanBtn: RoundButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var invitationMessageTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        invitationMessageTextField.delegate = self
        invitationMessageTextField.layer.cornerRadius = 10
        invitationMessageTextField.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        invitationMessageTextField.text = "Enter Invitation Message"
        invitationMessageTextField.textColor = UIColor.darkGray
        invitationMessageTextField.dropShadow()
        inviteFriendBtn.dropShadow()
        submitPlanBtn.dropShadow()
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
extension EditDetailsViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func restaurant_menu(_ sender: Any) {
    }
    @IBAction func callBtnAction(_ sender: Any) {
    }
    @IBAction func selectDateAction(_ sender: Any) {
    }
    @IBAction func selectTimeActionBtn(_ sender: Any) {
    }
    @IBAction func inviteFriendActionBtn(_ sender: Any) {
    }
    @IBAction func submitPlanActionBtn(_ sender: Any) {
    }
}


extension EditDetailsViewController: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {

        if invitationMessageTextField.textColor == UIColor.darkGray {
            invitationMessageTextField.text = ""
            invitationMessageTextField.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        if invitationMessageTextField.text == "" {
            invitationMessageTextField.text = "Enter Invitation Message"
            invitationMessageTextField.textColor = UIColor.darkGray
        }
    }
}


extension EditDetailsViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        return cell
    }
    
    
}
