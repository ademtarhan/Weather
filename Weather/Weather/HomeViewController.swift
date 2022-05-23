//
//  HomeViewController.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelTempature: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelRainFall: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let weather = CurrentWeather(temperature: 45, rainfall: "%35", humidity: 0.32, icon: "cloudy", location: "Battalgazi")
        let viewModel = CurrentWeatherModel(data: weather)
        showWeather(model: viewModel)
        
    }

    func showWeather(model: CurrentWeatherModel) {
        iconWeather.image = model.icon
        labelLocation.text = model.location
        labelTempature.text = model.temperature
        labelHumidity.text = model.humidity
        labelRainFall.text = model.rainfall
    }


}
