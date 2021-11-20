//
//  TimeViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 20/11/21.
//

import UIKit

class TimeViewController: UIViewController {
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var time_picker: UIDatePicker!
    var pdDelegate: SelectDateTimeDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.4, *) {
            time_picker.preferredDatePickerStyle = .wheels
        }
    }
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneBtn(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let selectedDate = formatter.string(from: time_picker.date)
        self.dismiss(animated: true, completion: nil)
        if let delegate = self.pdDelegate {
            delegate.time(time: selectedDate)
        }
    }
}
