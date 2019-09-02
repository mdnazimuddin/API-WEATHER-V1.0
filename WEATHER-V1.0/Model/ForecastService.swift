//
//  ForecastService.swift
//  WEATHER-V1.0
//
//  Created by Nazim Uddin on 1/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import Foundation
import Alamofire
class ForecastService
{
    //Sample Url: https://api.openweathermap.org/data/2.5/weather?q=Dhaka,bd&appid=e940750330c2e23b915410d54ffbcc6c
    let forecastAPIKey : String
    let forecastBaseURL : URL?
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=")
    }
    func getCurrentWeather(city:String, country:String,completion: @escaping (CurrentWeatherCityModel,CurrentWeather)->Void){
        if let forecastURL = URL(string: "\(forecastBaseURL!)\(city),\(country)&appid=\(forecastAPIKey)") {
            Alamofire.request(forecastURL).responseJSON { (response) in
                
                if let jsonDictionary = response.result.value as? [String:Any] {
                    let name = CurrentWeatherCityModel(name: jsonDictionary["name"] as! String)
                    if let currentWeatherDictionary = jsonDictionary["main"] as? [String : Any]{
                       let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                        completion(name,currentWeather)
                    }
                }
            }
        }
        
    }
}
