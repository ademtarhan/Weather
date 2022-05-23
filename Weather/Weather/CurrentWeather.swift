//
//  CurrentWeather.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
import UIKit

struct CurrentWeather{
    let temperature: Double
    let rainfall : String
    let humidity : Double
    let icon : String
    let location : String
    init(temperature: Double, rainfall: String, humidity: Double,icon: String,location: String){
        self.temperature = temperature
        self.rainfall = rainfall
        self.humidity = humidity
        self.icon = icon
        self.location = location
    }
}



extension CurrentWeather {
    var iconWeather: UIImage {
        switch icon {
        case "clear-day" : return UIImage(named: "cloud")!
        case "clear-night" : return UIImage(named: "sun.min.fill")!
        case "rain" : return UIImage(named: "sun.min.fill")!
        case "snow" : return UIImage(named: "sun.min.fill")!
        case "wind" : return UIImage(named: "sun.min.fill")!
        case "fog" : return UIImage(named: "sun.min.fill")!
        case "cloudy" : return UIImage(named: "cloud")!
        default:
            return UIImage(named: "cloud.fill") ?? UIImage(named: "cloud.fill") as! UIImage
        }
    }
}
