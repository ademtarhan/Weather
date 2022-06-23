//
//  HomeViewController.swift
//  Weather
//
//  Created by Adem Tarhan on 23.05.2022.
//

import UIKit

protocol HomeViewControllerImp : AnyObject{
    var presenter: HomePresenterImp? {get set}
    func displayCurrentt(_ current: CurrentWeatherModel)
}


class HomeViewController: UIViewController {
    var presenter: HomePresenterImp?

    
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelTempature: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelRainFall: UILabel!
//url = https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a39be32a3b9802f13a79fcc3ea03e8f5
   
    //..https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.presenter(for: "Dusseldorf")
        print("---43--")
        let weather = CurrentWeather(temperature: 45, rainfall: "%35", humidity: 0.32, icon: "clear-night", location: "Battalgazi")
        let viewModel = CurrentWeatherModel(data: weather)
        showWeather(model: viewModel)
        
        var requestUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=")
        
        
    }

    func showWeather(model: CurrentWeatherModel) {
        iconWeather.image = model.icon
        labelLocation.text = model.location
        labelTempature.text = model.temperature
        labelHumidity.text = model.humidity
        labelRainFall.text = model.rainfall
    }


}
