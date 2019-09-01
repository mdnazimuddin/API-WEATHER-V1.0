//
//  CurrentWeather.swift
//  WEATHER-V1.0
//
//  Created by Nazim Uddin on 1/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import Foundation
class CurrentWeather{

    /*
     {"coord":{"lon":85.17,"lat":26.67},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03d"}],"base":"stations","main":{"temp":308.9,"pressure":999.72,"humidity":51,"temp_min":308.9,"temp_max":308.9,"sea_level":999.72,"grnd_level":991.43},"wind":{"speed":3.36,"deg":27.762},"clouds":{"all":50},"dt":1567327029,"sys":{"message":0.0054,"country":"IN","sunrise":1567295930,"sunset":1567341641},"timezone":19800,"id":1273043,"name":"Dhaka","cod":200}
    */
    let temp:Int?
    let humidity:Int?
    let description:String?
    let cityName:String?
    struct WeatherKey {
        static let temp = "temp"
        static let humidity = "humidity"
        static let description = "description"
        static let cityName = "name"
    }
    init(weatherDictionary:[String : Any]) {
        temp = weatherDictionary[WeatherKey.temp] as? Int
        if let humidityDouble = weatherDictionary[WeatherKey.humidity] as? Int {
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }
        description = weatherDictionary[WeatherKey.description] as? String
        cityName = weatherDictionary[WeatherKey.cityName] as? String
    }
    
    
}
