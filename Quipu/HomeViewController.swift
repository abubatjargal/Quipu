//
//  HomeViewController.swift
//  Quipu
//
//  Created by Abu Batjargal on 8/22/17.
//  Copyright © 2017 Abu Batjargal. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var addressField: LoginTextField!
    @IBOutlet var pickupNow: UIButton!
    @IBOutlet var pickupLater: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupAddressField()
        setupUIButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.frame = UIScreen.main.bounds
        self.view.insertSubview(mapView, at: 0)
    }
    
    func setupAddressField() {
        self.addressField.delegate = self
        self.view.insertSubview(addressField, at: 2)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setupUIButtons() {
        self.view.insertSubview(pickupNow, at: 1)
        self.view.insertSubview(pickupLater, at: 1)
    }

}
