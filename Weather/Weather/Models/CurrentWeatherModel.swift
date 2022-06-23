//
//  CurrentWeatherModel.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
import UIKit

struct CurrentWeatherModel{
    let rainfall: String
    let icon: UIImage
    let temperature: String
    let humidity : String
    let location : String
    
    init( data : CurrentWeather) {
        self.rainfall = data.rainfall
        self.icon = data.iconWeather
        self.humidity = "%\(data.humidity*100)"
        self.location = data.location
        self.temperature = "\(Int(data.temperature))"
    }
}
