//
//  ViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 25/10/21.
//

import UIKit
import SDWebImage
import SideMenuSwift

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension UIViewController
{
    // Back Button calling
    func backBtn()
    {
        navigationController?.popViewController(animated: true)
    }
    func backCustomTime(time:Int) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - time], animated: true)
    }
    func homePage()
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SideMenuController") as! SideMenuController
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    @objc func openSideMenu()
//    {
//
//        sideMenuController?.revealMenu()
//        print("gvbv")
//    }
    func sideMenu() {
        SideMenuController.preferences.basic.menuWidth = 300
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.supportedOrientations = .portrait
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
    }
}


//MARK:- Validations on text field
extension UIViewController
{
    // Email Validation
    func validateEmailID(emailID:String) -> Bool {
        let emailString = emailID.replacingOccurrences(of: " ", with: "")
        if emailString.count == emailID.count {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: emailID)
        }else
        {
            return false
        }
    }
    
    // Mobile Validation
    func validateNumber(_ number: String) -> Bool {
      let usernameRegEx = "^[0-9]+$"
      let usernameValidator = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
      return usernameValidator.evaluate(with: number)
  }
}



//MARK:- CODE FOR CUSTOM TOAST
extension UIViewController
{
    func showToast(message : String, seconds: Double)
    {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet
        )
        let itemView = UIView(frame:CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width - 40, height:50))
        itemView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        itemView.contentMode = .center
        itemView.layer.cornerRadius = 10
        let label = UILabel()
       
        label.text = message
        label.translatesAutoresizingMaskIntoConstraints = false

        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        itemView.addSubview(label)
        alert.view.addSubview(itemView)
        alert.view.alpha = 0.8
        label.centerYAnchor.constraint(equalTo: itemView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: itemView.centerXAnchor).isActive = true
        alert.view.layer.cornerRadius = 10
        
        let height = NSLayoutConstraint(item: alert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let width = NSLayoutConstraint(item: alert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.size.width - 40)
        alert.view.addConstraint(height)
        alert.view.addConstraint(width)
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
