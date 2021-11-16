//
//  EditProfileViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 02/11/21.
//

import UIKit
import AVFoundation

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var firstNameTextField: TextFieldDesign!
    @IBOutlet weak var lastNameTextField: TextFieldDesign!
    @IBOutlet weak var userProfileImage: RoundImage!
    @IBOutlet weak var emailTextField: TextFieldDesign!
    @IBOutlet weak var submitBtn: RoundButton!
    @IBOutlet weak var cameraBtn: RoundButton!
    
    var image = UIImage(named:"no-image")
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.dropShadow()
        cameraBtn.dropShadow()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func cameraActionBtn(_ sender: Any) {
        checkCameraAccess()
        alertsheet(title: "Upload", txt: "Please select Image")
    }
    
    @IBAction func submitActionBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
}

//MARK:- Gallery and Camera Access
extension EditProfileViewController
{
    
    // For Checking Camera Access:
    func checkCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .denied:
                print("Denied, request permission from settings")
                presentCameraSettings()
            case .restricted:
                print("Restricted, device owner must approve")
            case .authorized:
                print("Authorized, proceed")
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { success in
                    if success {
                        print("Permission granted, proceed")
                    } else {
                        print("Permission denied")
                    }
                }
        default:
            print("-----")
        }
        }
    
    //For  Camera Settings:
    func presentCameraSettings() {
//            let alertController = UIAlertController(title: "Error",
//                                          message: "Camera access is denied",
//                                          preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
//            alertController.addAction(UIAlertAction(title: "Settings", style: .cancel,handler: {
//                (UIAlertAction) in
//                if let url = URL(string: UIApplication.openSettingsURLString) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: { _ in
//                        // Handle
//                    })
//                }
//            }))
        
        showCustomAlert(title: "Error", message: "Camera access is denied", view: self, btn_title: "Settings", actionHandler: {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                    // Handle
                })
            }
        })
     
            //present(alertController, animated: true)
        }
    
        //For Opening Camera:
        func camera()
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = self
                myPickerController.sourceType = .camera
                present(myPickerController, animated: true, completion: nil)
            }else{
                showSimpleAlert(title: "Warning", message: "No camera found", view: self)
            }
            
        }
    
     //For Opening Gallery:
     func photoLibrary()
        {
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = self
                myPickerController.sourceType = .photoLibrary
                present(myPickerController, animated: true, completion: nil)
            }else{
                showSimpleAlert(title: "Warning", message: "No PhotoLibrary found", view: self)
           }
        }
     
   // For event on cancel:
        //Delegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
              self.dismiss(animated: true, completion: nil)
          }
     
    //For set Image on image view:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
              let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
              //image = img
                userProfileImage.image = img
              self.dismiss(animated: true, completion: nil)
                
    }
    
    func alertsheet(title:String,txt:String){
        let alert = UIAlertController(title: title, message: txt, preferredStyle: .actionSheet)
        let Gallary = UIAlertAction(title: "Open Gallery", style: .destructive, handler: {
            (UIAlertAction) in
            self.photoLibrary()
        })
        let camera = UIAlertAction(title: "Open Camera", style: .destructive, handler:{
            (UIAlertAction) in
            self.camera()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler:nil)
        alert.addAction(Gallary)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}
