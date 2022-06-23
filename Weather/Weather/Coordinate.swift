//
//  Cordinate.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate : CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var battalgazi : Coordinate{
        return Coordinate(latitude: 38.4250, longitude: 38.3654)
    }
    
}
