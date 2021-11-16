//
//  VenusViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 08/11/21.
//

import UIKit

class VenusViewController: UIViewController {

    @IBOutlet weak var sort_by_low_to_high: UIButton!
    @IBOutlet weak var sort_by_high_to_low: UIButton!
    @IBOutlet weak var sortView: RoundView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var venuesTableView: UITableView!
    
    @IBOutlet weak var filterView: RoundView!
    
    @IBOutlet weak var filterByBowling: UIButton!
    @IBOutlet weak var filterByCafeBar: UIButton!
    
    @IBOutlet weak var filterByHookahBar: UIButton!
    
    @IBOutlet weak var filterByBuffet: UIButton!
    
    @IBOutlet weak var filterByFamilyStyle: UIButton!
    
    var isAppliedBowingFilter = 0
    var isAppliedCafeBarFilter = 0
    var isAppliedHookahBarFilter = 0
    var isAppliedBuffetFilter = 0
    var isAppliedFamilyStyleFilter = 0
    var isClickedFilter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegister()
        searchTextField.setLeftPaddingPoints(40)
        searchTextField.layer.cornerRadius = 5
        sortView.dropShadow()
        filterView.dropShadow()
        sortView.isHidden = true
        filterView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    func cellRegister()
    {
        venuesTableView.register(UINib(nibName: "EventPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "EventPlaceTableViewCell")
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    @IBAction func sortBtn(_ sender: Any) {
        sortView.isHidden = false
        filterView.isHidden = true
    }
    @IBAction func lowToHighBtn(_ sender: Any) {
        
        sort_by_low_to_high.setImage(UIImage(named: "pink_ball_icon"), for: UIControl.State.normal)
        sort_by_high_to_low.setImage(nil, for: UIControl.State.normal)
        sortView.isHidden = true
    }
    @IBAction func highToLowBtn(_ sender: Any) {
        
        sort_by_low_to_high.setImage(nil, for: UIControl.State.normal)
        sort_by_high_to_low.setImage(UIImage(named: "pink_ball_icon"), for: UIControl.State.normal)
        sortView.isHidden = true
    }
    @IBAction func filterBtn(_ sender: Any) {
        if isClickedFilter == 1{
            filterView.isHidden = true
            sortView.isHidden = true
            isClickedFilter = 0
        }else{
            isClickedFilter = 1
            filterView.isHidden = false
            sortView.isHidden = true
        }
    }
    
    
    @IBAction func filterByBowlingAction(_ sender: Any) {
        if isAppliedBowingFilter == 1{
            filterByBowling.setImage(nil, for: UIControl.State.normal)
            isAppliedBowingFilter = 0
        }else{
            filterByBowling.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
            isAppliedBowingFilter = 1
        }
    }
    @IBAction func filterByCafeBarAction(_ sender: Any) {
        if isAppliedCafeBarFilter == 1{
            filterByCafeBar.setImage(nil, for: UIControl.State.normal)
            isAppliedCafeBarFilter = 0
        }else{
            filterByCafeBar.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
            isAppliedCafeBarFilter = 1
        }
    }
    
    @IBAction func filterByHookahBarAction(_ sender: Any) {
        if isAppliedHookahBarFilter == 1{
            filterByHookahBar.setImage(nil, for: UIControl.State.normal)
            isAppliedHookahBarFilter = 0
        }else{
            filterByHookahBar.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
            isAppliedHookahBarFilter = 1
        }
    }
    @IBAction func filterByBuffetAction(_ sender: Any) {
        if isAppliedBuffetFilter == 1{
            filterByBuffet.setImage(nil, for: UIControl.State.normal)
            isAppliedBuffetFilter = 0
        }else{
            filterByBuffet.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
            isAppliedBuffetFilter = 1
        }
    }
    
    @IBAction func filterByFamilyStyleAction(_ sender: Any) {
        if isAppliedFamilyStyleFilter == 1{
            filterByFamilyStyle.setImage(nil, for: UIControl.State.normal)
            isAppliedFamilyStyleFilter = 0
        }else{
            filterByFamilyStyle.setImage(UIImage(named: "check_icon"), for: UIControl.State.normal)
            isAppliedFamilyStyleFilter = 1
        }
    }
    
    
}
extension VenusViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = venuesTableView.dequeueReusableCell(withIdentifier: "EventPlaceTableViewCell", for: indexPath) as! EventPlaceTableViewCell
        cell.host_stackview.isHidden = true
        cell.btn_1.isHidden = true
        cell.by_venue_View.isHidden = true
        cell.total_accepted_view.isHidden = true
        cell.btn_3.isHidden = true
        cell.btn_2.setImage(UIImage(named: "restaurant_menu_icon"), for: UIControl.State.normal)
        cell.event_image_height.constant = 140
        return cell
    }
    
    
}
extension VenusViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CreatePlanViewController") as! CreatePlanViewController
            self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
