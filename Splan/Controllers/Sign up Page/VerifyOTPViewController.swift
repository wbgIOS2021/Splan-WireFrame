//
//  VerifyOTPViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 26/10/21.
//

import UIKit

class VerifyOTPViewController: UIViewController {

    @IBOutlet weak var mobileLabel: UILabel!
    @IBOutlet weak var otpTextField_1: UITextField!
    @IBOutlet weak var otpTextField_2: UITextField!
    @IBOutlet weak var otpTextField_3: UITextField!
    @IBOutlet weak var otpTextField_4: UITextField!
    @IBOutlet weak var otpTextField_6: UITextField!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var otpTextField_5: UITextField!
    var otp_code:String = ""
    var isComeFromMyProfile = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupThings()
        verifyBtn.dropShadowLight()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text

        if (text?.utf16.count)! >= 1{
            switch textField{
            case otpTextField_1:
                otpTextField_2.becomeFirstResponder()
            case otpTextField_2:
                otpTextField_3.becomeFirstResponder()
            case otpTextField_3:
                otpTextField_4.becomeFirstResponder()
            case otpTextField_4:
                otpTextField_5.becomeFirstResponder()
            case otpTextField_5:
                otpTextField_6.becomeFirstResponder()
            case otpTextField_6:
                otpTextField_6.resignFirstResponder()
            default:
                break
            }
        }else{

        }
    }
    func setupThings()
    {
        otpTextField_1.delegate = self
        otpTextField_2.delegate = self
        otpTextField_3.delegate = self
        otpTextField_4.delegate = self
        otpTextField_5.delegate = self
        otpTextField_6.delegate = self

        otpTextField_1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField_2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField_3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField_4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField_5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        otpTextField_6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)

    }
    
    
}


extension VerifyOTPViewController:UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
//MARK:- Action Buttons
extension VerifyOTPViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func resendOtpBtnAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.showToast(message: "One time Password is 111111", seconds: 1.5)
        }
    }
    
    @IBAction func verifyBtnAction(_ sender: Any) {
        
        let otp1 = validateNumber(otpTextField_1!.text!)
        let otp2 = validateNumber(otpTextField_2!.text!)
        let otp3 = validateNumber(otpTextField_3!.text!)
        let otp4 = validateNumber(otpTextField_4!.text!)
        let otp5 = validateNumber(otpTextField_5!.text!)
        let otp6 = validateNumber(otpTextField_6!.text!)

        if otpTextField_1!.text! == "" || otpTextField_2!.text! == "" || otpTextField_3!.text! == "" || otpTextField_4!.text! == "" || otpTextField_5!.text! == "" || otpTextField_6!.text! == "" {

            showSimpleAlert(title: "Error", message: "Please enter OTP", view: self)
        }
        else if otp1 == false || otp2 == false || otp3 == false || otp4 == false || otp5 == false || otp6 == false{
            showSimpleAlert(title: "Error", message: "Invalid OTP", view: self)
        }else if isComeFromMyProfile == true {
            otp_code = "\(otpTextField_1.text!)" + "\(otpTextField_2.text!)" + "\(otpTextField_3.text!)" + "\(otpTextField_4.text!)" + "\(otpTextField_5.text!)" + "\(otpTextField_6.text!)"
            
//            let vc = storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
//            navigationController?.pushViewController(vc, animated: true)
            self.backBtn()
        }else{
            otp_code = "\(otpTextField_1.text!)" + "\(otpTextField_2.text!)" + "\(otpTextField_3.text!)" + "\(otpTextField_4.text!)" + "\(otpTextField_5.text!)" + "\(otpTextField_6.text!)"
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
    
