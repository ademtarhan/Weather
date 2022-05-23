//
//  Factory.swift
//  Weather
//
//  Created by Adem Tarhan on 22.05.2022.
//

import Foundation

class ViewControllerFactory {
    public static var shared = ViewControllerFactory()
    var home: HomeViewController{
        HomeViewController(nibName: "HomeViewController", bundle: nil)
    }
    
}

