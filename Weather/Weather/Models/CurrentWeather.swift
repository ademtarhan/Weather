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
        case "clear-day" : return UIImage(named: "sun")!
        case "clear-night" : return UIImage(named: "clear-night")!
        case "rain" : return UIImage(named: "rain")!
        case "snow" : return UIImage(named: "snow")!
        case "wind" : return UIImage(named: "wind")!
        case "fog" : return UIImage(named: "fog")!
        case "cloudy" : return UIImage(named: "cloudy")!
        default:
            return UIImage(named: "cloud.fill") ?? UIImage(named: "cloud.fill") as! UIImage
        }
    }
}

extension CurrentWeather {
    struct Key {
        static let temperature = "temperature"
        static let rainFall = "rainFall"
        static let humidity = "humidity"
        static let icon = "icon"
    }
    
    init?(json : [String:AnyObject]){
        guard let temperature = json[Key.temperature] as? Double,
              let rainFall = json[Key.rainFall] as? String,
              let humdity = json[Key.humidity] as? Double,
              let icon = json[Key.icon] as? String else {
                  return nil
              }
        self.temperature = temperature
        self.rainfall = rainFall
        self.humidity = humdity
        self.icon = icon
        return nil
    }
    
   
    
}
