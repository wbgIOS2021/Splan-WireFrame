//
//  MyProfileViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 01/11/21.
//

import UIKit
import SideMenuSwift

class MyProfileViewController: UIViewController {

    @IBOutlet weak var userProfilePic: RoundImage!
    @IBOutlet weak var nameTextField: TextFieldDesign!
    @IBOutlet weak var mobileTextField: TextFieldDesign!
    @IBOutlet weak var emailTextField: TextFieldDesign!
    @IBOutlet weak var changePasswordBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changePasswordBtn.dropShadow()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    
    @IBAction func editProfileActionBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func changePasswordActionBtn(_ sender: Any) {
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func editMobileActionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GetOTPViewController") as! GetOTPViewController
        vc.isComeFromMyProfile = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
