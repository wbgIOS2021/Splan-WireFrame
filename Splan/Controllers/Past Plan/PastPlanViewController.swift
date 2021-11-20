//
//  PastPlanViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 19/11/21.
//

import UIKit
import SideMenuSwift

class PastPlanViewController: UIViewController {

    @IBOutlet weak var segmentedBtn: CustomSegmentedControl!
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var menu_drawer_Btn: UIBarButtonItem!
    var segment_value = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        sideMenu()
        segmentedBtn.layer.cornerRadius = 20
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedBtn.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func cellRegister()
    {
        eventTableView.register(UINib(nibName: "EventPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "EventPlaceTableViewCell")
    }
    
    
    @IBAction func menuDrawerAction(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func didchangeValue(_ sender: UISegmentedControl)
    {
        switch segmentedBtn.selectedSegmentIndex
        {
        case 0:
            segment_value = 0
            eventTableView.reloadData()
            print("My Plan")
        case 1:
            segment_value = 1
            eventTableView.reloadData()
            print("My Invitations")
        default:
            break
        }
    }
    
    
}


extension PastPlanViewController: UITableViewDataSource
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
            cell.btn_3.isHidden = true
            cell.host_stackview.isHidden = true
            return cell
        }
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
        cell.btn_1.isHidden = true
        cell.btn_2.isHidden = true
        cell.btn_3.isHidden = true
        cell.host_stackview.isHidden = false
        return cell
    }
}

extension PastPlanViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.eventTableView.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.eventTableView.isUserInteractionEnabled = true
            if self.segment_value == 0
            {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyPlanDetailsViewController") as! MyPlanDetailsViewController
                vc.isComeFromPastPlan = true
            self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "InvitationDetailsViewController") as! InvitationDetailsViewController
                vc.isComeFromPastPlan = true
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
