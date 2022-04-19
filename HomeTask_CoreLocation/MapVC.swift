//
//  MapVC.swift
//  HomeTask_CoreLocation
//
//  Created by baxa on 09/04/22.
//

import UIKit
import MapKit
import CoreLocation


class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    
    @IBAction func weatherTappex(_ sender: Any) {
        let vc = WeatherVC(nibName: "WeatherVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

    }
    

    @IBAction func stopTapped(_ sender: UIButton) {
        
        locationManager.stopUpdatingLocation()

    }
    
    @IBAction func startTapped(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
        
    }
    

}

extension MapVC: MKMapViewDelegate{
    
}

extension MapVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first!
        var region = MKCoordinateRegion()
        region.center = location.coordinate
        self.mapView.setRegion(region, animated: true)
        print("userLocation")
    }
}
