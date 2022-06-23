//
//  Errors.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import Foundation

enum Errors{
    case RequestError
    case ResponseUnsuccesful(statusCode: Int)
    case invalidData
    case JSONParsingError
    case invalidUrl
}
