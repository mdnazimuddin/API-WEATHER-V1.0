//
//  CurrentWeather.swift
//  WEATHER-V1.0
//
//  Created by Nazim Uddin on 1/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import Foundation
class CurrentWeather{
    var temp:String!

    init(weatherDictionary:[String : Any]) {
        let  weather:[String:Any] = weatherDictionary
        let value = "\(weather["temp"]!)"
        print("tempture : \(value)")
        self.temp = self.setTemp(value: value)
    }
    func setTemp(value:String)->String{
        return value
    }
}
class CurrentWeatherCityModel{
    var name:String!
    init(name:String) {
        self.name = name
    }
}

