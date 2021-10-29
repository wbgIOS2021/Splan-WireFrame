//
//  GetOTPViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 26/10/21.
//

import UIKit

class GetOTPViewController: UIViewController {

    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var getOtpBtn: UIButton!
    @IBOutlet weak var mobileTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        getOtpBtn.dropShadow()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
}

//MARK:- Action Buttons
extension GetOTPViewController
{
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func countryCodeBtnAction(_ sender: Any) {
    }
    
    @IBAction func getOtpBtnAction(_ sender: Any) {
        let mobile = validateNumber(mobileTextField!.text!)

        if mobileTextField!.text! == ""
        {
            showSimpleAlert(title: "Error", message: "Please enter Mobile number", view: self)
        }
        else if mobile == false || mobileTextField!.text!.count != 10
        {
            showSimpleAlert(title: "Error", message: "Invalid mobile number", view: self)
        }else{
            DispatchQueue.main.async {
                self.showToast(message: "One time Password is 111111", seconds: 1.5)
            }
            let vc = storyboard?.instantiateViewController(withIdentifier: "VerifyOTPViewController") as! VerifyOTPViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
