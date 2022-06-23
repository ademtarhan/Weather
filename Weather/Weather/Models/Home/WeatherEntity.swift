//
//  WeatherEntity.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation
import UIKit

struct WeatherEntity {
    struct Current {
        struct ViewModel {
            let conditaion: String
            let temperature: String
            let rainFall: String
            let humidity: String
            let icon: String
        }
    }
    struct Daily {
        struct ViewModel {
            let day: String
            let condition: String
            let temperature: String
        }
    }
}


