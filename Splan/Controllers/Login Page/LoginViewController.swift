//
//  LoginViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 26/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailMobileTextField: TextFieldDesign!
    
    @IBOutlet weak var passwordTextField: TextFieldDesign!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordEyeBtn: UIButton!
    var passwordEyeBtnClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.dropShadowLight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        //Status Bar
        let topInset: CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? UIApplication.shared.statusBarFrame.size.height
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: topInset))
        
        statusBarView.backgroundColor = dark_black_color
        self.navigationController?.view.addSubview(statusBarView)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    
}

//MARK:- Action Buttons
extension LoginViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.homePage()
    }
    
    @IBAction func passwordEyebtnAction(_ sender: Any) {
        if(passwordEyeBtnClick == true) {
            passwordTextField.isSecureTextEntry = false
            passwordEyeBtn.setImage(UIImage(named: "open_eye_icon"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordEyeBtn.setImage(UIImage(named: "close_eye_icon"), for: .normal)
        }
        passwordEyeBtnClick = !passwordEyeBtnClick
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        //let mobile = validateNumber(emailMobileTextField!.text!)
        //let email = validateEmailID(emailID: emailMobileTextField.text!)
        
        if emailMobileTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Email or Mobile number", view: self)
        }

        else if passwordTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter password", view: self)
        }
        else{
            self.homePage()
            
        }
    }
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GetOTPViewController") as! GetOTPViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
