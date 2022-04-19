//
//  WeatherVC.swift
//  HomeTask_CoreLocation
//
//  Created by baxa on 11/04/22.
//

import UIKit
import CoreLocation

class WeatherVC: UIViewController {

    
    @IBOutlet weak var txtFld: UITextField!
    @IBOutlet weak var gradusLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    var locationManager: CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }


    @IBAction func getTapped(_ sender: Any) {
        getWeather(q: txtFld.text!) { weather in
            DispatchQueue.main.async {
                self.gradusLbl.text = "\(weather.current.tempC) C"
                self.cityLbl.text = weather.location.name
            }
        }
    }
    
    
    
    func getWeather(q: String,completion:@escaping (Weather) -> Void){
        let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=f469276e931e44a5880121956221903&q=\(q)")!
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                print("Ishladi")
                if let weather = self.decodeJSON(data: data){
                    completion(weather)
                }
            }
        }.resume()
    }
    
    func decodeJSON(data: Data) -> Weather?{
        let decoder = JSONDecoder()
        
        do{
            let weather = try decoder.decode(Weather.self, from: data)
            return weather
        } catch{
            print(error)
        }
        
        return nil
        
    }
    
}
extension WeatherVC: CLLocationManagerDelegate{
    
}
