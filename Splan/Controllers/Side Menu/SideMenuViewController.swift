//
//  SideMenuViewController.swift
//  Dorothy
//
//  Created by Adarsh Raj on 02/09/21.
//

import UIKit
import SideMenuSwift

class SideMenuViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var menuTable: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var menuView:UIView!
    @IBOutlet weak var upperSectionView: UIView!
    @IBOutlet weak var checkLoginBtn: UIButton!
    
    var menuItems:[[String:Any]] = [["thumb":"home_icon","name":"Home","page_id":""],["thumb":"past_plan_icon","name":"Past Plan","page_id":""],["thumb":"profile_icon","name":"Profile","page_id":""],["thumb":"about_splan_icon","name":"About SPLAN","page_id":""],["thumb":"contact_us_icon","name":"Contact Us","page_id":""],["thumb":"term_condition_icon","name":"Terms & Conditions","page_id":""],["thumb":"logout_icon","name":"Logout","page_id":""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTable.dataSource = self
        menuTable.delegate = self
        checkLoginBtn.layer.cornerRadius = 10
        
        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        blurredView.frame = self.menuView.bounds
        menuView.addSubview(blurredView)
        
        checkLoginBtn.isHidden = true
        nameLabel.isHidden = true
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        menuTable.reloadData()
    }
    
}

extension SideMenuViewController
{
    @IBAction func loginbtn(_ sender:UIButton)
    {
        let login = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(login, animated: true)
    }
}

// MARK:Menu View
extension SideMenuViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTable.dequeueReusableCell(withIdentifier: "SideMneuTableViewCell", for: indexPath) as! SideMneuTableViewCell
       

        let cellData = menuItems[indexPath.row]
        cell.menuTitleLabel!.text! = cellData["name"] as! String
        cell.menuIcon!.image = UIImage(named: cellData["thumb"] as! String)
        
        return cell
    }
    
}

extension SideMenuViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        switch indexPath.row{
        
        case 0:
            // Home
            print(menuItems[indexPath.row])
            sideMenuController?.hideMenu()
            self.homePage()
        case 1:
            // Past Plan
            print("Past Plan - ",menuItems[indexPath.row])
            sideMenuController?.hideMenu()
        case 2:
            //Profile
            print("Profile - ",menuItems[indexPath.row])
            sideMenuController?.setContentViewController(with: "myprofile")
            sideMenuController?.hideMenu()
            
        case 3:
            //About SPLAN
            print("About SPLAN - ",menuItems[indexPath.row])
            sideMenuController?.setContentViewController(with: "aboutSplan")
            sideMenuController?.hideMenu()
            
        case 4:
            // Contact Us
            print("Contact Us - ",menuItems[indexPath.row])
            sideMenuController?.setContentViewController(with: "contactUS")
            sideMenuController?.hideMenu()
            
        case 5:
            // Term & Condition
            sideMenuController?.hideMenu()
            print("Term & Condition - ",menuItems[indexPath.row])
        case 6:
            // Logout
            sideMenuController?.hideMenu()
            print("Logout - ",menuItems[indexPath.row])
            let login = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.navigationController?.pushViewController(login, animated: true)
        
        default:
           // sideMenuController?.hideMenu()
        print("Default Calling")
            
        }
        
    }
}

