//
//  DescriptionPageViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 05/11/21.
//

import UIKit

class DescriptionPageViewController: UIViewController {

    @IBOutlet weak var descriptionImage: RoundImage!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionContent: UILabel!
    @IBOutlet weak var navbar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    
    @IBAction func menuBtnAction(_ sender: Any) {
        sideMenuController?.revealMenu()
    }
    
}
