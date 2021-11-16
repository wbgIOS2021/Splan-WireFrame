//
//  RegisterViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 26/10/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordEyeBtn: UIButton!
    @IBOutlet weak var confirmPasswordEyeBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var fullNameTextField: TextFieldDesign!
    @IBOutlet weak var emailTextField: TextFieldDesign!
    
    @IBOutlet weak var passwordTextField: TextFieldDesign!
    @IBOutlet weak var confirmPasswordTextField: TextFieldDesign!
    @IBOutlet weak var mobileTextField: TextFieldDesign!
    var passwordEyeBtnClick = true
    var confirmPasswordEyeBtnClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupBtn.dropShadowLight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
}

//MARK:- Action Buttons
extension RegisterViewController
{
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
    
    
    @IBAction func confirmPasswordEyebtnAction(_ sender: Any) {
        if(confirmPasswordEyeBtnClick == true) {
            confirmPasswordTextField.isSecureTextEntry = false
            confirmPasswordEyeBtn.setImage(UIImage(named: "open_eye_icon"), for: .normal)
        } else {
            confirmPasswordTextField.isSecureTextEntry = true
            confirmPasswordEyeBtn.setImage(UIImage(named: "close_eye_icon"), for: .normal)
        }
        confirmPasswordEyeBtnClick = !confirmPasswordEyeBtnClick
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signupBtnAction(_ sender: Any) {
        let mobile = validateNumber(mobileTextField!.text!)
        let email = validateEmailID(emailID: emailTextField.text!)
        
        if fullNameTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Full Name", view: self)
        }
        else if mobileTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Email or Mobile number", view: self)
        }
        else if mobile == false || mobileTextField!.text!.count != 10
        {
            showSimpleAlert(title: "Error", message: "Invalid mobile number", view: self)
        }
        else if emailTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Email ID", view: self)
        }
        else if email == false
        {
            showSimpleAlert(title: "Error", message: "Invalid Email", view: self)
        }
        else if passwordTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Password", view: self)
        }
        else if confirmPasswordTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Confirm Password", view: self)
        }
        else if passwordTextField!.text! != confirmPasswordTextField!.text!
        {
            showSimpleAlert(title: "Error", message: "Password and Confirm Password Not Match!!!!", view: self)
        }
        else{
            self.homePage()
        }
    }
    
}
