//
//  DateViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 20/11/21.
//

import UIKit

class DateViewController: UIViewController {
    @IBOutlet weak var date_picker: UIDatePicker!
    @IBOutlet weak var cancelBtn: UIButton!
    var pdDelegate: SelectDateTimeDelegate?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if #available(iOS 13.4, *) {
            date_picker.preferredDatePickerStyle = .wheels
        }
    }
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneBtn(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd - MM - yyyy"
        let selectedDate = formatter.string(from: date_picker.date)
        self.dismiss(animated: true, completion: nil)
        if let delegate = self.pdDelegate {
            delegate.date(date: selectedDate)
        }
    }
}
