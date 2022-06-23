//
//  APICallable.swift
//  Weather
//
//  Created by Adem Tarhan on 23.06.2022.
//

import Foundation

protocol ApiCallable : AnyObject{
    var apiKey: String {get}
    var baseUrl: String {get}
}

extension ApiCallable{
    var apiKey: String { return "a39be32a3b9802f13a79fcc3ea03e8f5"}
    var baseUrl: String {return "https://api.openweathermap.org/data/2.5/"}
}
