//
//  CreatePlanViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 08/11/21.
//

import UIKit
import ImageSlideshow

class CreatePlanViewController: UIViewController {

    @IBOutlet weak var event_image: RoundImage!
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_place: UILabel!
    @IBOutlet weak var event_meet_time: UILabel!
    @IBOutlet weak var restaurant_special: UILabel!
    @IBOutlet weak var price_for_one: UILabel!
    @IBOutlet weak var selectDateBtn: RoundButton!
    @IBOutlet weak var inviteFriendBtn: RoundButton!
    @IBOutlet weak var selectTimeBtn: RoundButton!
    @IBOutlet weak var userListTableView: UITableView!
    @IBOutlet weak var userListTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var submitPlanBtn: RoundButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var invitationMessageTextField: UITextView!
   
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    var timer:Timer?
    var currentCellIndex = 0
    var bannerImageArray = ["user_icon-1","restrurant_icon","app_logo","no_image"]

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
        
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(autoSlide) , userInfo: nil, repeats: true)
        bannerPageControl.numberOfPages = bannerImageArray.count
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Removing Observer
        self.userListTableView.removeObserver(self, forKeyPath: "contentSize")
        timer?.invalidate()
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
    @objc func autoSlide()
    {
        if currentCellIndex < bannerImageArray.count - 1
        {
            currentCellIndex = currentCellIndex + 1
        }else{
            currentCellIndex = 0
        }
        bannerPageControl.currentPage = currentCellIndex
        //print("currentCellIndex",currentCellIndex)
        UIView.animate(withDuration: 1.0, animations: {
            [weak self] in
            self?.bannerCollection.scrollToItem(at: IndexPath(item: self?.currentCellIndex ?? 0, section: 0), at: .right, animated: true)
        })
        bannerCollection.reloadData()
        
    }
    
    
}

//MARK:- Action Button
extension CreatePlanViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func restaurant_menu(_ sender: Any) {
    }

    @IBAction func selectDateAction(_ sender: Any) {
    }
    @IBAction func selectTimeActionBtn(_ sender: Any) {
    }
    @IBAction func inviteFriendActionBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InviteFriendsViewController") as! InviteFriendsViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    @IBAction func submitPlanActionBtn(_ sender: Any) {
    }
}


extension CreatePlanViewController: UITextViewDelegate
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


extension CreatePlanViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userListTableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        return cell
    }
    
    
}

extension CreatePlanViewController:UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = bannerCollection.dequeueReusableCell(withReuseIdentifier: "BannerImageCollectionViewCell", for: indexPath) as! BannerImageCollectionViewCell
            cell.bannerImage.image = UIImage(named: bannerImageArray[currentCellIndex])
            return cell
        
    }
}
extension CreatePlanViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollection.frame.width, height: bannerCollection.frame.height)
    }
}
