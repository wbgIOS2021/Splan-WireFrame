//
//  TermAndCondtionViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 19/11/21.
//

import UIKit


class TermAndCondtionViewController: UIViewController {

    @IBOutlet weak var termAndCondtionImage: RoundImage!
    @IBOutlet weak var termAndCondtionTitle: UILabel!
    @IBOutlet weak var termAndCondtionContent: UILabel!
    
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
