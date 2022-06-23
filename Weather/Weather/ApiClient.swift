//
//  ApiClient.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation

class ApiClient{
    //.."https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a39be32a3b9802f13a79fcc3ea03e8f5")
    private let apiKey = "a39be32a3b9802f13a79fcc3ea03e8f5"
    //..var baseUrl = URL(string: "https://api.openweathermap.org/data/2.5/")
    lazy var baseUrl: URL = {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(Coordinate.battalgazi.latitude)&lon=\(Coordinate.battalgazi.longitude)&appid=\(apiKey)")
    }()!
    
    
    let service = Service()
    
    typealias CurrentWeatherComplationHandler = (CurrentWeather?,Errors?) -> Void
    func getCurrentWeather(at coordinate: Coordinate,complationhandler completion: @escaping CurrentWeatherComplationHandler){
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil,Errors.invalidUrl)
            return
        }
        let requestURL = URLRequest(url: url)
        
        let dataTask = service.jsonTask(with: requestURL){ json, error in
            
            
        }
        
    }
    
}
