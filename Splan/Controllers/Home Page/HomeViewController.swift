//
//  HomeViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 27/10/21.
//

import UIKit
import SideMenuSwift

class HomeViewController: BaseViewController {

    @IBOutlet weak var notificationBtn: UIBarButtonItem!
    @IBOutlet weak var segmentedBtn: CustomSegmentedControl!
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var menu_drawer_Btn: UIBarButtonItem!
    @IBOutlet weak var createPlanBtn: UIButton!
    var bolValue:[Bool] = []
    var segment_value = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        sideMenu()
        createPlanBtn.roundShadow()
        segmentedBtn.layer.cornerRadius = 20
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedBtn.setTitleTextAttributes(titleTextAttributes, for: .selected)
        boolValueFalseSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        sideMenuSetting()
        //Status Bar
        let topInset: CGFloat = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? UIApplication.shared.statusBarFrame.size.height
        let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height: topInset))
        
        statusBarView.backgroundColor = light_black_color
        self.navigationController?.view.addSubview(statusBarView)
        setNeedsStatusBarAppearanceUpdate()
        
        
        
    }
    
    func sideMenuSetting(){
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController")
        }, with: "myprofile")
        
        sideMenuController?.cache(viewControllerGenerator: {
             self.storyboard?.instantiateViewController(withIdentifier: "DescriptionPageViewController")
            
        }, with: "aboutSplan")
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController")
            
        }, with: "contactUS")
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "TermAndCondtionViewController")
            
        }, with: "termAndCondition")
        
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: "PastPlanViewController")
            
        }, with: "pastPlans")
        
    }
    
    func cellRegister()
    {
        eventTableView.register(UINib(nibName: "EventPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "EventPlaceTableViewCell")

    }
    
    func boolValueFalseSetup()
    {
        for _ in 0..<8{
            self.bolValue.append(false)
        }
    }
    
    @IBAction func menuDrawerAction(_ sender: Any) {
        sideMenuController?.revealMenu()

    }
    
    
    
    @IBAction func notificationBtnAction(_ sender: Any) {
        
        
    }
    @IBAction func createPlanBtnAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VenusViewController") as! VenusViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didchangeValue(_ sender: UISegmentedControl)
    {
        switch segmentedBtn.selectedSegmentIndex
        {
        case 0:
            segment_value = 0
            bolValue.removeAll()
            boolValueFalseSetup()
            eventTableView.reloadData()
            
            print("My Plan")
        case 1:
            segment_value = 1
            bolValue.removeAll()
            boolValueFalseSetup()
            print(bolValue)
            eventTableView.reloadData()
            print("My Invitations")
        default:
            break
        }
    }
    
    
}


extension HomeViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 8
       
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segment_value == 0
        {
           let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
            cell.btn_1.isHidden = true
            cell.btn_2.isHidden = true
            cell.host_stackview.isHidden = true
//            if bolValue[indexPath.row]
//            {
//                cell.eventView.layer.backgroundColor = light_black_color.cgColor
//                cell.event_meet_time.textColor = white_color
//                cell.event_place.textColor = white_color
//                cell.event_title.textColor = white_color
//                cell.restaurant_special.textColor = white_color
//                cell.total_accepted.textColor = white_color
//                cell.eventView.dropShadowLight()
//            }else{
//                cell.eventView.layer.backgroundColor = white_color.cgColor
//                cell.event_meet_time.textColor = dark_black_color
//                cell.event_place.textColor = dark_black_color
//                cell.event_title.textColor = dark_black_color
//                cell.total_accepted.textColor = dark_black_color
//                cell.restaurant_special.textColor = gray_color
//                cell.eventView.dropShadow()
//            }
            return cell
        }
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
        cell.btn_1.setImage(UIImage(named: "check_mark"), for: UIControl.State.normal)
        cell.btn_2.setImage(UIImage(named: "cross_mark"), for: UIControl.State.normal)
        cell.btn_1.isHidden = false
        cell.btn_2.isHidden = false
        cell.host_stackview.isHidden = false
//         if bolValue[indexPath.row]
//         {
//             cell.eventView.layer.backgroundColor = light_black_color.cgColor
//             cell.event_meet_time.textColor = white_color
//             cell.event_place.textColor = white_color
//             cell.event_title.textColor = white_color
//             cell.event_hosted_by.textColor = white_color
//             cell.restaurant_special.textColor = white_color
//             cell.total_invited.textColor = white_color
//             cell.eventView.dropShadowLight()
//         }else{
//             cell.eventView.layer.backgroundColor = white_color.cgColor
//             cell.event_meet_time.textColor = dark_black_color
//             cell.event_place.textColor = dark_black_color
//             cell.event_title.textColor = dark_black_color
//             cell.event_hosted_by.textColor = dark_black_color
//             cell.total_invited.textColor = dark_black_color
//             cell.restaurant_special.textColor = gray_color
//             cell.eventView.dropShadow()
//         }
         return cell
    }
}

extension HomeViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if bolValue[indexPath.row]{
            for x in 0..<bolValue.count{
                if x == indexPath.row{
                    bolValue[x] = true
                }
            }
        }else{
            for x in 0..<bolValue.count{
                if x == indexPath.row{
                    bolValue[x] = true
                }else{
                    bolValue[x] = false
                }
            }
        }
        eventTableView.reloadData()
        self.eventTableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.eventTableView.isUserInteractionEnabled = true
            if self.segment_value == 0
            {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPlanDetailsViewController") as! MyPlanDetailsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "InvitationDetailsViewController") as! InvitationDetailsViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
