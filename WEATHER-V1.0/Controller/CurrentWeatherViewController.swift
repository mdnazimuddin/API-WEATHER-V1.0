//
//  ViewController.swift
//  WEATHER-V1.0
//
//  Created by Nazim Uddin on 1/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var fahrenheitLbl: UILabel!
    
    var cityName:String!
    var countryKey:String!
    
    let forecastAPIKey = "e940750330c2e23b915410d54ffbcc6c"
    var forecastService:ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityName = "Dhaka"
        countryKey = "BD"
        getWeatherData(cityName: cityName, countryKey: countryKey)
        
    }
    func getWeatherData(cityName:String,countryKey:String){
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(city: cityName, country: countryKey) { (city,currentWeather) in
            DispatchQueue.main.async {
                let temp:Int = (Int(Double(currentWeather.temp)! - 273.15))
                self.temperatureLbl.text = "\(temp)°"
                self.cityLbl.text = city.name ?? ""
                self.fahrenheitLbl.text = "CELSIUS"
            }
        }
    }
    @IBAction func getCityAction(_ sender: UIButton) {
        let getLocationData:GetLocationViewController = storyboard?.instantiateViewController(withIdentifier: "GetLocationViewController") as! GetLocationViewController
        getLocationData.delegat = self
        navigationController?.pushViewController(getLocationData, animated: true)
    }
    
}

extension CurrentWeatherViewController:GetLocationDelegat{
    func saveData(city: String, countryKey: String) {
        self.cityName = city
        self.countryKey = countryKey
        getWeatherData(cityName: cityName, countryKey: countryKey)
        navigationController?.popViewController(animated: true)
    }
    
    
}
