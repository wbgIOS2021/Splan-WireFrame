//
//  AlertMessages.swift
//  Dorothy
//
//  Created by Adarsh Raj on 29/07/21.
//

import UIKit


typealias alertActionHandler = () -> Void
func showAlertWithOk(title: String, message: String, view : UIViewController,actionHandler:@escaping alertActionHandler) -> Void {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default,handler :{
        (UIAlertAction) in
        actionHandler()
    })
    alert.addAction(action)
    view.present(alert, animated: true, completion: nil)
}

func showCustomAlert(title: String, message: String,view : UIViewController,btn_title: String,actionHandler:@escaping alertActionHandler) -> Void {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: btn_title, style: .default,handler :{
        (UIAlertAction) in
        actionHandler()
    })
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    alert.addAction(cancelAction)
    alert.addAction(OKAction)
    view.present(alert, animated: true, completion: nil)
}

func showSimpleAlert(title: String, message: String,view : UIViewController) -> Void {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(OKAction)
    view.present(alert, animated: true, completion: nil)
}

