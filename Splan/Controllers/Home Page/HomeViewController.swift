//
//  HomeViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 27/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var notificationBtn: UIBarButtonItem!
    @IBOutlet weak var segmentedBtn: CustomSegmentedControl!
    
    @IBOutlet weak var eventTableView: UITableView!
    @IBOutlet weak var menu_drawer_Btn: UIBarButtonItem!
    @IBOutlet weak var createPlanBtn: UIButton!
    var bolValue:[Bool] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        createPlanBtn.roundShadow()
        segmentedBtn.layer.cornerRadius = 20
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        segmentedBtn.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentedBtn.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        for _ in 0..<8{
            self.bolValue.append(false)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func cellRegister()
    {
        eventTableView.register(UINib(nibName: "EventPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "EventPlaceTableViewCell")

    }
    @IBAction func menuDrawerAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func segmentedBtnAction(_ sender: Any) {
    }
    @IBAction func notificationBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MyPlanDetailsViewController") as! MyPlanDetailsViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func createPlanBtnAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditDetailsViewController") as! EditDetailsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 8
       
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
        cell.call_btn.isHidden = true
        if bolValue[indexPath.row]
        {
            cell.eventView.layer.backgroundColor = light_black_color.cgColor
            cell.event_meet_time.textColor = white_color
            cell.event_place.textColor = white_color
            cell.event_title.textColor = white_color
            cell.event_status.textColor = white_color
            cell.no_of_invite.textColor = white_color
        }else{
            cell.eventView.layer.backgroundColor = white_color.cgColor
            cell.event_meet_time.textColor = dark_black_color
            cell.event_place.textColor = dark_black_color
            cell.event_title.textColor = dark_black_color
            cell.event_status.textColor = dark_black_color
            cell.no_of_invite.textColor = dark_black_color

        }
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
    }
    
}
