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
    
    let forecastAPIKey = "e940750330c2e23b915410d54ffbcc6c"
    var location:(city:String,country:String) = ("Dhaka","BD")
    var forecastService:ForecastService!
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(city: location.city, country: location.country) { (currentWeather,city) in
            DispatchQueue.main.async {
                let temp:Int = (Int(Double(currentWeather.temp!)! - 273.15))
                self.temperatureLbl.text = "\(temp)°" 
                self.cityLbl.text = city.name ?? ""
                self.fahrenheitLbl.text = "CELSIUS"
            }
        }
    }


}

