//
//  CustomLocationViewController.swift
//  Splan
//
//  Created by Adarsh Raj on 17/11/21.
//

import UIKit
import GoogleMaps

class CustomLocationViewController: UIViewController {

    @IBOutlet weak var addressTextField: TextFieldDesign!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var locationNameTextField: TextFieldDesign!
    @IBOutlet weak var bottomview: UIView!
    @IBOutlet weak var continueBtn: UIView!
    
    private let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        continueBtn.dropShadow()
        bottomview.dropShadow()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.backBtn()
    }
    
    @IBAction func continueBtn(_ sender: Any) {
    }
    
}


// MARK: - CLLocationManagerDelegate
//1
extension CustomLocationViewController: CLLocationManagerDelegate {
  // 2
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    // 3
    guard status == .authorizedWhenInUse else {
      return
    }
    // 4
    locationManager.startUpdatingLocation()
      
    //5
    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }
  
  // 6
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
      
    // 7
    mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
      
    // 8
    locationManager.stopUpdatingLocation()
  }
    
    private func reverseGeocodeCoordinate(_ coordinate: CLLocationCoordinate2D) {
        
      // 1
      let geocoder = GMSGeocoder()
        
      // 2
      geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
        guard let address = response?.firstResult(), let lines = address.lines else {
          return
        }
          
        // 3
        self.addressTextField.text = lines.joined(separator: "\n")
          
        // 4
        UIView.animate(withDuration: 0.25) {
          self.view.layoutIfNeeded()
        }
      }
    }

}

extension CustomLocationViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
      reverseGeocodeCoordinate(position.target)
    }
}
