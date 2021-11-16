//
//  ContactUsViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 05/11/21.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var location_icon: UIButton!
    @IBOutlet weak var phone_icon: UIButton!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var email_icon: UIButton!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    
    func setUp()
    {
        location_icon.layer.borderColor = UIColor.gray.cgColor
        location_icon.layer.borderWidth = 0.4
        phone_icon.layer.borderColor = UIColor.gray.cgColor
        phone_icon.layer.borderWidth = 0.4
        email_icon.layer.borderColor = UIColor.gray.cgColor
        email_icon.layer.borderWidth = 0.4
        fullNameTextField.setLeftPaddingPoints(40)
        emailTextField.setLeftPaddingPoints(40)
        mobileTextField.setLeftPaddingPoints(40)
        
        messageTextField.delegate = self
        messageTextField.layer.cornerRadius = 5
        
        messageTextField.contentInset = UIEdgeInsets(top: 5, left: 40, bottom: 0, right: 10)
        messageTextField.text = "Enter Message"
        messageTextField.textColor = UIColor.darkGray
        //messageTextField.dropShadow()
        submitBtn.dropShadow()
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func submitActionBtn(_ sender: Any) {
    }
    

}

extension ContactUsViewController: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {

        if messageTextField.textColor == UIColor.darkGray {
            messageTextField.text = ""
            messageTextField.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {

        if messageTextField.text == "" {
            messageTextField.text = "Enter Message"
            messageTextField.textColor = UIColor.darkGray
        }
    }
}



