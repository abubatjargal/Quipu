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

class HomeViewController: UIViewController, UITextFieldDelegate, UISearchBarDelegate, LocateOnTheMap,GMSAutocompleteFetcherDelegate  {

    @IBOutlet var pickupNow: UIButton!
    @IBOutlet var pickupLater: UIButton!
    @IBOutlet var googleMapsContainer: UIView!
    
    @IBOutlet var searchButton: UIButton!
    
    var googleMapsView: GMSMapView!
    var searchResultController: SearchResultsController!
    var resultsArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupUIButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        gmsFetcher = GMSAutocompleteFetcher()
        gmsFetcher.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 42.356965, longitude:  -71.069506, zoom: 12)
        googleMapsView = GMSMapView.map(withFrame: .zero, camera: camera)
        googleMapsView.frame = UIScreen.main.bounds
        self.view.insertSubview(googleMapsView, at: 0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setupUIButtons() {
        self.view.insertSubview(pickupNow, at: 1)
        self.view.insertSubview(pickupLater, at: 1)
        searchButton.layer.masksToBounds = true
        searchButton.layer.cornerRadius = searchButton.frame.width/2
        searchButton.titleLabel?.textAlignment = NSTextAlignment.center
        self.view.insertSubview(searchButton, at: 1)
    }
    public func didFailAutocompleteWithError(_ error: Error) {
        //        resultText?.text = error.localizedDescription
    }
    
    /**
     * Called when autocomplete predictions are available.
     * @param predictions an array of GMSAutocompletePrediction objects.
     */
    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        //self.resultsArray.count + 1
        
        for prediction in predictions {
            
            if let prediction = prediction as GMSAutocompletePrediction!{
                self.resultsArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultsArray)
        //   self.searchResultsTable.reloadDataWithArray(self.resultsArray)
        print(resultsArray)
    }


    /**
     action for search location by address
     
     - parameter sender: button search location
     */
    
    @IBAction func searchWithAddress(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations:{
            self.searchButton.frame = CGRect(x: self.searchButton.frame.origin.x + 100, y: self.searchButton.frame.origin.y, width: self.searchButton.frame.size.width, height: self.searchButton.frame.size.height)
        })
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.present(searchController, animated:true, completion: nil)
    }
    
    /**
     Locate map with longitude and longitude after search location on UISearchBar
     
     - parameter lon:   longitude location
     - parameter lat:   latitude location
     - parameter title: title of address location
     */
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        DispatchQueue.main.async() { () -> Void in
            
            
            let position = CLLocationCoordinate2DMake(lat, lon)
            let marker = GMSMarker(position: position)
            self.googleMapsView.isMyLocationEnabled = true
            self.googleMapsView.animate(toLocation: position)
            marker.title = "Address : \(title)"
            marker.map = self.googleMapsView
            
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.3, animations:{
            self.searchButton.frame = CGRect(x: self.searchButton.frame.origin.x - 100, y: self.searchButton.frame.origin.y, width: self.searchButton.frame.size.width, height: self.searchButton.frame.size.height)
        })
    }
    
    /**
     Searchbar when text change
     
     - parameter searchBar:  searchbar UI
     - parameter searchText: searchtext description
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
                let placeClient = GMSPlacesClient()
        
        
                placeClient.autocompleteQuery(searchText, bounds: nil, filter: nil)  {(results, error: Error?) -> Void in
                   // NSError myerr = Error;
                    print("Error @%",Error.self)
        
                    self.resultsArray.removeAll()
                    if results == nil {
                        return
                    }
        
                    for result in results! {
                        if let result = result as? GMSAutocompletePrediction {
                            self.resultsArray.append(result.attributedFullText.string)
                        }
                    }
        
                    self.searchResultController.reloadDataWithArray(self.resultsArray)
        
                }
        
        
        self.resultsArray.removeAll()
        gmsFetcher?.sourceTextHasChanged(searchText)
        
        
    }

}
